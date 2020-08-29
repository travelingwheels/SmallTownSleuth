class CommentsController < ApplicationController
    before_action :redirect_if_not_logged_in

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
            #raise params.inspect
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
            #raise params.inspect
        else
            @comments = Comment.all
        end
    end


    def show
      @comment = Comment.find_by_id(params[:id])
    end


    def edit
        @comment = Comment.find_by_id(params[:id])
    end


    def update
        @comment = Comment.find_by_id(params[:id])
        if @comment.update(comment_params)
            redirect_to comment_path(@comment)
        else
            render :edit
        end
    end

    def destroy
        @comment = Comment.find_by(id: params[:id])
        @comment.destroy
        redirect_to review_comments_path(@comment.review_id)
    end



    private

        def comment_params
            params.require(:comment).permit(:content, :review_id, :user_id)
        end

end
