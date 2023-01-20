class ApplicationController < ActionController::Base

    http_basic_authenticate_with name: "ishika", password: "123"

    #rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found
        render plain: '404 not found',status: 404
    end

end
