class ReviewsController < ApplicationController

  def create 
    review =  Review.create(review_params)
    render json: review, methods: [:anime_rating], include: [:user]
  end 

  def destroy 
    review = Review.find(params[:id])
    review.delete 
    render json: review, methods: [:anime_rating]
  end

  private 
  def review_params
    params.require(:review).permit! 
  end
end
