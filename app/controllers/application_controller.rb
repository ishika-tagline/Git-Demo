class ApplicationController < ActionController::Base
  # rescue_from CanCan::AccessDenied do |exception|
  #     #redirect_to root, :alert => exception.message
  #     #render plain: exception.message
  #   end
  # skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
  # before_action :authenticate
  # http_basic_authenticate_with name: "ishika", password: "123"
  # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found
    render plain: '404 not found', status: 404
  end

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource)
    # new_user_session_path
    home_path
  end


end
