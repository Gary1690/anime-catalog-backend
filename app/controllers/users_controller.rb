class UsersController < ApplicationController

    def login
        user = User.find_by(user_params)
        render json: user, include: [:animes], methods:[:my_anime_ids] 
    end

    def create
        user = User.create(user_params)
        render json: user, include:[:animes], methods:[:my_anime_ids]
    end

    private

    def user_params
        params.require(:user).permit! 
    end
    
end
