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
    if params[:search]
      @life_hacks = LifeHack.search(params[:search]).page(params[:page]).per(20)
    else
      @life_hacks = LifeHack.all.page(params[:page]).per(20)
    end
  end
  
  def about
    
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

end
