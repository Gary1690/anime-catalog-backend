class UsersController < ApplicationController

    def login
        user = User.find_by(user_params)
        render json: user, include: [:animes] 
    end

    def create
        user = User.create(user_params)
        render json: user, include: [:animes]
    end

    private

    def user_params
        params.require(:user).permit! 
    end
    
end
