class Anime < ApplicationRecord
    has_many :reviews
    has_many :favorites
    has_many :users, through: :favorites

    def get_rating
        average_rating = 0 
        if self.reviews.length > 0
            sum = self.reviews.reduce(0){|sum,review| sum + review.rating }
            average_rating  = sum/self.reviews.length
        end
        average_rating
    end 
end
