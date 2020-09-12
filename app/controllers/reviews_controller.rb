class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update]

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
    if @review.save
      redirect_to review_path(@review)
    else
      @review.build_town
      render :new
    end
  end

  def index
    if params[:town_id] && @town = Town.find_by_id(params[:town_id])
      @reviews = @town.reviews
    else
      @reviews = Review.all
    end
  end

  def show
  end

  def edit
    #raise params.inspect
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    Review.find_by(id: params[:id]).destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :user_id, :town_id, town_attributes: [:name, :state])
  end

  def set_review
    @review = Review.find_by(id: params[:id])
    redirect_to reviews_path if !@review
  end
end
