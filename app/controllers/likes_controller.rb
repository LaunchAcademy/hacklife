class LikesController < ApplicationController
 before_filter :authenticate_user!, only: [:create, :new]

   def create
    @like = Like.new(like_params)
    @like.user = current_user

    if @like.save
      redirect_to review_path(@like.review),
      notice: 'Review liked!'
    else

    end

   end

  private

  def like_params
    params.require(:like).permit(:score, :review_id)
  end



end
