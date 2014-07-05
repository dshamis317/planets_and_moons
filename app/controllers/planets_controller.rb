class PlanetsController < ApplicationController

  def index
    @planets = Planet.all
  end

  def create
    new_planet = Planet.create(planet_params)
    redirect_to planet_path(new_planet)
  end

  def new
  end

  def show
    @planet = Planet.find(params[:id])
  end

  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    planet = Planet.find(params[:id])
    planet.update(planet_params)
    redirect_to planet_path(planet)
  end

  private

  def planet_params
    params.require(:planet).permit(:name, :life, :image_url)
  end

end
