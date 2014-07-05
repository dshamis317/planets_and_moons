require 'spec_helper'

describe Planet do

  describe "#introduction" do

    it "introduces itself" do
      earth = Planet.new({name: "Earth", life: true, image_url: "http://upload.wikimedia.org/wikipedia/commons/6/6f/Earth_Eastern_Hemisphere.jpg"})
      actual = earth.introduction
      expected = "I am planet Earth, you could see me here: http://upload.wikimedia.org/wikipedia/commons/6/6f/Earth_Eastern_Hemisphere.jpg"
      expect(actual).to eq(expected)
    end

  end

end
