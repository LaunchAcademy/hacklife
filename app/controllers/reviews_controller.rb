class ReviewsController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :destroy]
  before_filter :authorize_user, only: :destroy

  def new
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = Review.new
  end

  def create
    @life_hack = LifeHack.find(params[:life_hack_id])
    @review = @life_hack.reviews.build(review_params)
    @review.user = current_user

    if @review.save
      ReviewMailer.notify(@life_hack.user).deliver
      redirect_to life_hack_path(@life_hack),
        notice: 'Review was successfully added'
    else
      flash[:notice] = "Fields can't be blank"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @like = @review.likes.find_by(user: current_user) || Like.new
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to root_path, notice: "Review Deleted"
  end

  private

  def review_params
    params.require(:review).permit(:title,:body,:rating)
  end

end
