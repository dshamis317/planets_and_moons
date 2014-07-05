class MoonsController < ApplicationController

  def index
    planet = Planet.find(params[:planet_id])
    @moons = planet.moons
  end

end
