class ReviewsController < ApplicationController
  

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
      #raise params.inspect
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
    if params[:town_id] && @town = Town.find_by_id(params[:town_id])
      @reviews = @town.reviews
      #raise params.inspect
    else
     @reviews = Review.all
    end
  end

  def show
    #raise params.inspect
    @review = Review.find_by_id(params[:id])
    redirect_to reviews_path if !@review
  end

  def edit
    @review = Review.find_by(id: params[:id])
    #raise params.inspect
  end

  def update
    @review = Review.find_by(id: params[:id])
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
    params.require(:review).permit(:content, :user_id, :town_id, town_attributes:[:name, :state])
  end
end
