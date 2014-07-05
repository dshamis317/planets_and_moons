require 'spec_helper'

describe MoonsController do

  describe 'given a moon' do

    before :each do
      @mars = Planet.new
      @mars.name = 'Mars'
      @mars.life = false
      @mars.image_url = 'http://space-facts.com/wp-content/uploads/mars.jpg'
      @mars.save

      @moon = Moon.new
      @moon.name = 'Moon'
      @moon.image_url = 'http://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg'
      @moon.planet_id = 1
    end

    describe 'GET index' do

      before :each do
        get :index, :planet_id => @mars.id
      end

      it 'responds successfully' do
        actual = response.code
        expected = '200'
        expect(actual).to eq(expected)
      end

      it 'assigns @moons' do
        actual = assigns(:moons)
        expected = [@moon]
        expect(actual).to eq(expected)
      end

    end # GET moons index



  end

end
