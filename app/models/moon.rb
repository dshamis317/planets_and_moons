class Moon < ActiveRecord::Base
  belongs_to :planet

  def introduction
    "I am a moon called #{self.name}, you could see me here: #{self.image_url}"
  end

end
