class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
  end

  def create
    new_planet = Planet.create(planet_params)
    redirect_to planet_path(new_planet)
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :life, :image_url)
  end

end
