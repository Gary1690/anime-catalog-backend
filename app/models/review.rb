class Review < ApplicationRecord
  belongs_to :user
  belongs_to :anime

  def anime_rating
    self.anime.get_rating
  end 
end
