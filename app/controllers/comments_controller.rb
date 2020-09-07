class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    if params[:review_id] && @review = Review.find_by_id(params[:review_id])
      @comment = @review.comments.build
    else
      @comment = Comment.new
      @comment.build_review
    end
  end

  def create
    if params[:review_id] && @review = Review.find_by_id(params[:review_id])
      @comment = @review.comments.build(comment_params)
    else
      @comment = Comment.new(comment_params)
    end

    if @comment.save
      redirect_to comment_path(@comment)
    else
      render :new
   end
  end

  def index
    if params[:review_id] && @review = Review.find_by_id(params[:review_id])
      @comments = @review.comments
    else
      @comments = Comment.all
    end
  end

  def show
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to review_comments_path(@comment.review_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :review_id, :user_id)
  end

  def set_comment
    @comment = Comment.find_by_id(params[:id])
    redirect_to comments_path if !@comment
  end
end
