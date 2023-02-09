class Api::V1::AccountsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token

    before_action :get_user, only: %i[index create]

    def index
        if @user.present?
            @accounts=@user.acc
                if @accounts.empty?
                    error_json(@accounts,"Yet account not found",[])
                else
                    hash=AccSerializer.new(@accounts).serializable_hash
                    success_json(hash)
                end
        else
            error_json(@accounts,"Requested user account not found",[])
        end
    end

    def create
        account_list=[];
        if @user.present?
            if params[:account].present?
                params[:account].each do |account|
                    acc= @user.acc.create(name: account[:name])
                    if acc
                    account_list.append(acc)
                    end
                end
            else
                error_json([],"Please provid account detail",[])
                return
            end
        else
            error_json([],"User not found",[])
            return
        end
        hash=AccSerializer.new(account_list).serializable_hash
        success_json(hash)
    end

    def destroy

    end
    private

    def account_params
        params.require(:account).permit(:name)
    end

    def get_user
        @user = User.find_by(id:params[:user_id])
    end
end

