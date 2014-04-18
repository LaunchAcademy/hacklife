class LifeHacksController < ApplicationController
  before_filter :authenticate_user!, only: [:create, :new, :destroy]
  before_filter :authorize_user, only: :destroy

  def new
    @life_hack = LifeHack.new
  end

  def create
    @life_hack = LifeHack.new(life_hack_params)
    @life_hack.user = current_user
    if @life_hack.save
      redirect_to '/life_hacks', notice: 'LifeHack was successfully added'
    else
      render :new
    end
  end

  def index
    @life_hacks = LifeHack.all
  end

  def show
    @life_hack = LifeHack.find(params[:id])
  end

  def destroy
    @life_hack = LifeHack.find(params[:id])
    @life_hack.destroy
    redirect_to root_path, notice: "Article Deleted"
  end

  private

  def life_hack_params
    params.require(:life_hack).permit(:title, :link, :content)
  end

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ApplicationController::RoutingError.new('Not Found')
    end
  end
end
