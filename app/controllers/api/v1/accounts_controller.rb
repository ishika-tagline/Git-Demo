class Api::V1::AccountsController < Api::V1::BaseController
    skip_before_action :verify_authenticity_token
    before_action :get_user_or_account, only: %i[index create destroy update]

    def index
       return error_json(@accounts,"Requested user account not found", []) if @user.present?
        @accounts=@user.acc
        return error_json(@accounts, "Yet account not found", []) if @accounts.empty?
        hash=AccSerializer.new(@accounts).serializable_hash
        success_json(hash)
    end

    def create
        account_list=[]
        return error_json([], "User not found", []) if !@user.present?  
        return error_json([], "Please provid account detail", []) if !params[:account].present?
        acc = @user.acc.create(account_params)
        return error_json([], "Something went wrong", acc.errors.full_messages) if acc.invalid?
        account_list.append(acc)
         hash=AccSerializer.new(account_list).serializable_hash
         success_json(hash)
    end

    def destroy
        return error_json([], "User not found", []) if !@user.present?  
        return error_json([], "Account not found", []) if @account.nil?
        return error_json([], "Requested account not belong to you", []) if !@user.acc.include?(@account)
        @account.destroy
        success_json({})
    end 
    
    def update
        return error_json([], "User not found", []) if @user.nil?  
        return error_json([], "Account not found", []) if @account.nil?
        return error_json([], "Requested account not belong to you", []) if !@user.acc.include?(@account)
        unless @account.update(account_params)
            return error_json([], "Something went wrong", @account.errors.full_messages)
        end
        hash=AccSerializer.new(@account).serializable_hash
        success_json(hash)
    end
    
    private

    def account_params
        params.require(:account).permit(:name)
    end

    def get_user_or_account
        @account = Account.find_by(id:params[:id].presence)
        @user = User.find_by(id:params[:user_id])
    end
end

