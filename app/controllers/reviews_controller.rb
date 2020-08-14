class ReviewsController < ApplicationController
  before_action :redirect_if_not_logged_in

  def new
    #if params[:user_id] && @user = User.find_by_id([:user_id])
      #@review = @user.reviews.build
      #@review.build_town
    #else
      @review = Review.new
      @review.build_town
    #end
  end

  def create
    #raise params.inspect
    @review = Review.new(review_params)#current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
    #@reviews = Review.includes(:user).all
  end

  def show
    @review = Review.find_by_id(params[:id])
    redirect_to town_review_path if !@review
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :town_id, town_attributes:[:name, :state, :amenities])
  end
end
