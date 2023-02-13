class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
  
  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource)
    home_path
  end


end
