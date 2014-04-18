class CommentsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]
  before_filter :authorize_user, only: :delete

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

  def destroy
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to root_path, notice: "Comment Deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :review_id)
  end

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new('Not Found')
    end
  end

end
