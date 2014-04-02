class WelcomeController < ApplicationController
  def index
    redirect_to life_hacks_path
  end
end
