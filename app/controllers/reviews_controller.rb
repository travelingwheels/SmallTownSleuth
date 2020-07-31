class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    @Review = Review.new
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to reviews_path
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
