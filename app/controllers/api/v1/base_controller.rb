class Api::V1::BaseController < ApplicationController

    def success_json(data)
        message_status={status:200,message:'success'}
        render json: data.merge!(message_status) 
    end

    def error_json(data,message,error)
        render json: {data:data,message:message,status:503,error:error} 
    end
end