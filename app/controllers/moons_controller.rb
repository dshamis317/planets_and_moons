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
  end

  private

  def moon_params
    params.require(:moon).permit(:name, :image_url, :planet_id)
  end

end
