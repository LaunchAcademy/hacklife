class LikesController < ApplicationController
 before_filter :authenticate_user!, only: [:create, :new]

   def create
    @like = Like.new(like_params)
    @like.user = current_user

    if @like.save
      redirect_to review_path(@like.review),
      notice: 'You Voted!'
    else
      redirect_to review_path(@like.review),
      alert: 'You already voted for this.'

    end

   end

   def update

    @like = Like.find(params[:id])
    @like.score = params[:like][:score]
    @like.save
    redirect_to review_path(@like.review),
    notice: 'Updated'

  end


  private

  def like_params
    params.require(:like).permit(:score, :review_id)
  end



end
