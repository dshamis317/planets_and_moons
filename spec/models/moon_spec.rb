require 'spec_helper'

describe Moon do

  before :each do
    @mars = Planet.new
    @mars.name = 'Mars'
    @mars.life = false
    @mars.image_url = 'http://space-facts.com/wp-content/uploads/mars.jpg'
    @mars.save
  end

    describe "#introduction" do

      it "introduces itself" do
        moon = Moon.new({name: "Moon", image_url: "http://placekitten.com/200/200"})
        actual = moon.introduction
        expected = "I am a moon called Moon, you could see me here: http://placekitten.com/200/200"
        expect(actual).to eq(expected)
      end

    end
  end
