class FavoritesController < ApplicationController

    def create 
        favorite =  Favorite.where(:user_id => favorite_params[:user_id], :anime_id => favorite_params[:anime_id]).first_or_create
        render json: favorite, include: [:user, :anime]
      end 
    
    
      private 
      def favorite_params
        params.require(:favorite).permit! 
      end

end
