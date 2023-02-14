class Api::V1::BaseController < ApplicationController
    include JsonWebToken
    before_action :authentic_employee

    def authentic_employee
        header=request.headers["Authorization"]
        header=header.split(" ").last if header
        decode= jwt_decode(header)
        @cuurent_user=Employee.find(decode[:id])
        
        rescue ActiveRecord::RecordNotFound=>e
            render json: {error: e.message}, status: :unauthorized
        rescue JWT::DecodeError => e
            render json: { errors: e.message }, status: :unauthorized
    end

    def success_json(data)
        message_status={status:200,message:'success'}
        render json: data.merge!(message_status) 
    end

    def error_json(data,message,error)
        render json: {data:data,message:message,status:503,error:error} 
    end
end