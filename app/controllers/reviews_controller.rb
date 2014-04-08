class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: :create

  def new
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = Review.new
  end

  def create
    params["review"]["user_id"] = current_user.id
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

  private

  def review_params
    params.require(:review).permit(:title,:body,:rating,:user_id)
  end

end
