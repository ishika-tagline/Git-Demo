class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters
   skip_forgery_protection
    #include DeviseTokenAuth::Concerns::SetUserByToken
  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource)
    home_path
  end

  def configure_permitted_parameters
    p "configure_permitted_parameters call ............"
    added_attrs = [:section]
    devise_parameter_sanitizer.permit(:sign_up ,keys: [:section_id])
  end
end
