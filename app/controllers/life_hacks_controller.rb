class LifeHacksController < ApplicationController
  before_filter :authenticate_user!, only: :create
  
  def new
    @life_hack = LifeHack.new
  end

  def create
    params["life_hack"]["user_id"] = current_user.id
    @life_hack = LifeHack.new(life_hack_params)
    
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

  private

  def life_hack_params
    params.require(:life_hack).permit(:title, :link, :content, :user_id)
  end
end
