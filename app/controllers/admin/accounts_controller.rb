class Admin::AccountsController < ApplicationController

    before_action :set_user,only: %i[index show edit update destroy]
    before_action :set_account,only: %i[show edit update destroy]
    
    def index
        @accounts=@user.acc;
    end


    def new
        
    end

    def show
    end

    def edit
    end

    def update

        respond_to do |format|
            if @account.update(account_param)
                
                format.html {redirect_to [@user,@account], notice: 'Account was successfully updated'}        
            end
        end
        
    end

    def destroy
        @account.destroy
        respond_to do |format|
            format.html {redirect_to user_accounts_path(@user), notice: 'Account was successfully destroy'}
          end
    end


    def account_param
        params.require(:account).permit(:name)
    end

    def set_user
        p 'set user call...............'
        @user=User.find(params[:user_id])
    end

    def set_account
        p 'set account call...............'
        @account=Account.find(params[:id]);

        # if(params[:user_id])
        #     @user=User.find(params[:user_id])
        # end
            
    end

end
