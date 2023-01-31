class ApplicationController < ActionController::Base

    #before_action :authenticate
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_sign_in_params, only: [:create]
  
    #http_basic_authenticate_with name: "ishika", password: "123"
    #rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def record_not_found
        render plain: '404 not found',status: 404
    end

    def after_sign_in_path_for(resource)
        root_path
    end

    def after_sign_out_path_for(resource)
        #new_user_session_path
        home_path
    end

   
    def configure_sign_up_params
        p 'in application controller...........'
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:age,:gender])
     end
    
    def configure_sign_in_params
         devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    end
    
  

end
