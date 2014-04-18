class LikesController < ApplicationController
  before_filter :authenticate_user!

   def create
    @like = Like.new(like_params)
    @like.user = current_user
    if @like.save
      redirect_to review_path(@like.review),
      notice: 'You Voted!'
    else
      redirect_to review_path(@like.review),
      alert: 'Vote failed.'
    end
   end

   def update
    @like = current_user.likes.find(params[:id])
    @like.update(like_params)
    flash[:notice] = 'Updated.'
    redirect_to review_path(@like.review)
  end


  private

  def like_params
    params.require(:like).permit(:score, :review_id)
  end



end
