# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:facebook]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  # skip_before_action :authenticate_user!, only: [:facebook]

  def facebook
    info = request.env['omniauth.auth']['info']
    name = info[:name]
    email = info[:email]
    auth_data = request.env['omniauth.auth']['provider'] # facebook
    @user = User.where(name:).or(User.where(email:))
    if @user.nil?
      p 'User is null ............................'
      p "data.............#{name + ' ' + email + ' auth data:: ' + auth_data}"
      User.create(name:, email:, password: '123456')
    end
    p "user data..........#{@user.first.email}"
    sign_in @user.first
    redirect_to users_path
  end
  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
