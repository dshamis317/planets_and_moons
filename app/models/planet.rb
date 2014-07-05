class Planet < ActiveRecord::Base
  has_many :moons

  def introduction
    "I am planet #{self.name}, you could see me here: #{self.image_url}"
  end
end
