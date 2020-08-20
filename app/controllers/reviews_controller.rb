class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    if params[:town_id] && @town = Town.find_by_id(params[:town_id])
      @review = @town.reviews.build
    else
      @review = Review.new
      @review.build_town
    end
  end

  def create
    if params[:town_id] && @town = Town.find_by_id(params[:town_id])
      @review = @town.reviews.build(review_params)
    else
      @review = Review.new(review_params)
    end
    #raise params.inspect
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index
    if params[:town_id] && town = Town.find_by_id(params[:town_id])
      @reviews = town.reviews
    else
     @reviews = Review.all
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
    redirect_to reviews_path if !@review
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :town_id, town_attributes:[:name, :state, :amenities])
  end
end
