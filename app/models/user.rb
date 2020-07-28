class User < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :animes, through: :favorites

    def my_anime_ids
        self.animes.map{|anime|anime.id}
    end
end
