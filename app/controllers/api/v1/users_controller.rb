class Api::V1::UsersController < Api::V1::BaseController
    
    skip_before_action :verify_authenticity_token
    before_action :get_user, only: %i[show update destroy]
    
    def index
        @users = User.includes(:acc)
        if @users.empty?
            error_json([],"You requested data not found",[])
        else
            hash=UserSerializer.new(@users,{ fields: { user: [:name,:email,:account_list] } }).serializable_hash
            success_json(hash)
        end        
    end

    def show
        if check_user
            get_json
        else
            error_json({},"You requested data not found",[])
        end
    end
        

    def update
        if check_user
            if @user.update(user_params)
            get_json
            else
                error_json({},"something went wrong",@user.errors.full_messages)    
            end
        else
            error_json({},"You requested data not found",[])
        end
    end
    
    def destroy
        if check_user
            @user.destroy
            hash={} 
            success_json(hash)    
        else
            error_json({},"You requested data not found",[])
        end
    end
   

    def get_user
        p ":::::::::::get_user function call"
        @user=User.find_by(id:params[:id])
    end

    def get_json
        p ":::::::::::get_json function call"
        hash=UserSerializer.new(@user).serializable_hash
        success_json(hash)
    end

    def user_params
        params.require(:user).permit(:name,:email,:age,:id)
    end

    def check_user
        return  @user.nil? ? false : true
    end
end