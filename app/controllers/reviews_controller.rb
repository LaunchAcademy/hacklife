class ReviewsController < ApplicationController

  def new
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = Review.new
  end

  def create
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = @life_hack.reviews.build(review_params)

    if @review.save
      redirect_to life_hack_path(@life_hack),
      notice: 'Review was successfully added'
    else
      flash[:notice] = "Fields can't be blank"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:title,:body,:rating, :user_id)
  end

end
