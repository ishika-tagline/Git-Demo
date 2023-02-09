class UpdateUser
    def initialize(user,params)
        @params=params
        @user=user
    end

    def call(*args)
        new(*args).update_user
    end

    def update_user
        @user.update(@params)
    end
end