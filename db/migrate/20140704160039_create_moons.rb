class CreateMoons < ActiveRecord::Migration
  def change
    create_table :moons do |t|
      t.string :name
      t.string :image_url
      t.integer :planet_id

      t.timestamps
    end
  end
end
