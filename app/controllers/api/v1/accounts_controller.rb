class Api::V1::AccountsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token
    before_action :get_user_or_account, only: %i[index create destroy update]

    def index
        if @user.present?
            @accounts=@user.acc
                if @accounts.empty?
                    error_json(@accounts, "Yet account not found",[])
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

        return error_json([], "User not found",[]) if !@user.present?  
        return error_json([], "Please provid account detail", []) if !params[:account].present?

                params[:account].each do |account|
                    acc= @user.acc.create(name: account[:name])
                    if acc.invalid?
                        error_json([], "Something went wrong", acc.errors.full_messages)
                        return
                    end 
                    account_list.append(acc)
                end
        
        hash=AccSerializer.new(account_list).serializable_hash
        success_json(hash)
    end

    def destroy
        return error_json([],"User not found",[]) if !@user.present?  
        return error_json([],"Account not found",[]) if @account.nil?
        return error_json([],"Requested account not belong to you",[]) if !@user.acc.include?(@account)
        @account.destroy
        success_json({})
    end 
    
    def update
        return error_json([], "User not found",[]) if @user.nil?  
        return error_json([], "Account not found", []) if @account.nil?
        return error_json([],"Requested account not belong to you",[]) if !@user.acc.include?(@account)
        unless @account.update(name:params[:account][:name])
            return error_json([],"Something went wrong",@account.errors.full_messages)
        end
        hash=AccSerializer.new(@account).serializable_hash
        success_json(hash)
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

