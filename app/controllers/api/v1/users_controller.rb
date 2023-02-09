class Api::V1::UsersController < Api::V1::BaseController
    
    skip_before_action :verify_authenticity_token

    before_action :get_user, only: %i[show update destroy]
    
    def index
        @users = User.includes(:acc)
        hash=UserSerializer.new(@users).serializable_hash
        success_json(hash)
    end

    def show
        get_json
    end

    def update
        @user.update!(user_params)
        get_json
    end
    
    def destroy
        @user.destroy
        get_json
    end
   
    private

    def get_user
        @user=User.find(params[:id])
    end

    def get_json
        p ":::::::::::get_json function call"
        hash=UserSerializer.new(@user).serializable_hash
        success_json(hash)
    end

    def user_params
        params.require(:user).permit(:name,:email,:age,:id)
    end
end