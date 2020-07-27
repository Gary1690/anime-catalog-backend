class AnimesController < ApplicationController

    def index
        animes = Anime.all
        render json:animes
    end

    def show
        anime = Anime.find(params[:id])
        render json: anime, include: [:reviews]
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
