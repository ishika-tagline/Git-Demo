class Api::V1::AccountsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token

    before_action :get_user_or_account, only: %i[index create destroy   ]

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
                    p "count::::::::::::1"
                    if acc.invalid?
                        p "In unless part call:::::::::::"
                        error_json([],"Something went wrong",acc.errors.full_messages)
                        return
                    end 
                    account_list.append(acc)
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
        return error_json([],"User id required",[]) if @user.nil?  
        return error_json([],"Account is required",[]) if @account.nil?
        return error_json([],"Requested account not belong to you",[]) if !@user.acc.include?(@account)
        @account.destroy
        success_json({})
    end 
    
    private

    def account_params
        params.require(:account).permit(:name)
    end

    def get_user_or_account
        @account=Account.find_by(id:params[:id].presence)
        @user = User.find_by(id:params[:user_id])
    end
end

