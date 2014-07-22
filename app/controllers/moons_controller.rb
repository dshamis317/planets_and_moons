class MoonsController < ApplicationController

  def index
    planet = Planet.find(params[:planet_id])
    @moons = planet.moons
  end

  def create
    planet = Planet.find(params[:planet_id])
    new_moon = Moon.create(moon_params)
    planet.moons << new_moon
    redirect_to planet_moon_path(planet, new_moon)
  end

  def new
    @moon = Moon.new
  end

  def show
    planet = Planet.find(params[:planet_id])
    @moon = planet.moons.find(params[:id])
  end

  def edit
    planet = Planet.find(params[:planet_id])
    @moon = planet.moons.find(params[:id])
  end

  def update
    planet = Planet.find(params[:planet_id])
    moon = planet.moons.find(params[:id])
    moon.update(moon_params)
    redirect_to planet_moon_path(planet, moon)
  end

  def destroy
    planet = Planet.find(params[:planet_id])
    moon = planet.moons.find(params[:id])
    Moon.delete(moon)
    redirect_to planet_path(planet)
  end

  private

  def moon_params
    params.require(:moon).permit(:name, :image_url, :planet_id)
  end

end
