class CommentsController < ApplicationController

  before_filter :authenticate_user!, only: [:new, :create]
  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def create
    params[:comment][:user_id] = current_user.id
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to review_path(@review),
      notice: 'Comment was successfully added'
    else
      flash[:alert] = 'Comment unsuccessful'
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :review_id)
  end

end
