class AnimesController < ApplicationController

    def index
        animes = Anime.all
        render json: animes, methods: [:get_rating]
    end

    def show
        anime = Anime.find(params[:id])
        render json: anime.to_json(:include => {
            :reviews => {:only => [:id, :content, :rating, :user_id, :anime_id], :include => [:user => {:only => [:username, :img_url]}]}
        }, :methods => [:get_rating])
    end


    def create
        anime = Anime.create(anime_params)
        render json:anime
    end

    def edit
        anime = Anime.find(params[:id])
        anime.update(anime_params)
        render json:anime
    end

    def delete
        anime = Anime.find(params[:id])
        anime.delete
        render json: anime
    end

    private

    def anime_params
        params.require(:anime).permit(:title, :img_url, :description, :screen, :age_rating)
    end

end
