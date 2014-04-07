class ReviewsController < ApplicationController

  # /life_hacks/3/reviews/new
  def new
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = Review.new
  end

  def create
    @life_hack = LifeHack.find(params[:id])
    @review = @life_hack.reviews.build(review_params)

    if @review.save
      redirect_to "/life_hacks/#{@life_hack.id}",
      notice: 'Review was successfully added'
    else
      flash[:notice] = "There was an issue with your review. Please try again."
      render 'life_hacks/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:title,:body,:rating, :life_hack_id)
  end

end
