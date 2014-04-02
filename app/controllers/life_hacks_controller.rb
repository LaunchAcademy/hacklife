class LifeHacksController < ApplicationController
  def new
    @life_hack = LifeHack.new
  end

  def create
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

  private

  def life_hack_params
    params.require(:life_hack).permit(:title, :link, :content)
  end
end
