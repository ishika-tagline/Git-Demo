class UsersController < ApplicationController

  before_action :set_user, only: %i[show edit update destroy]
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:home]
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_sign_in_params, only: [:create]

  def index
    @users = User.includes(:acc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def edit; end

  def update
    authorize! :edit, @user,:message => "Can not update other user detail"
    respond_to do |format|
       if UpdateUser.new(@user,user_params).update_user 
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroy' }
    end
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name age gender])
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

  def home; end

  def get_name
    render plain: "name: #{params[:name]} default value: #{params[:age]}"
  end

  def get_bio
    @user = { name: 'ishika', age: 21 }
    p Rails.root
    p params
    render variants: %i[new get_bio]
  end

  def get_resume
  end

  def create_form
    @user = User.first
  end

  def get_form
    redirect_to users_show_path
  end

  def update_form
    render plain: 'hii'
  end

  def show_form; end

  def user_params
    params.require(:user).permit(:email, :name, :age, :gender,:image,role_ids: [])
  end

  def acc_params
    params.require(:acc).permit(:name)
  end

  def set_user
    id = params[:id].presence || params[:user_id]
    @user = User.find(id)
  end

  def authe nticate_user!
    if user_signed_in?
      users_path
    else
      redirect_to home_path
    end
  end
end
