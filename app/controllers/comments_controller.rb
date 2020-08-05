class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :new
    end
  end

  def index
    @comments = Comment.all
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
