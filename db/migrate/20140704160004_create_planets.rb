class CreatePlanets < ActiveRecord::Migration
  def change
    create_table :planets do |t|
      t.string :name
      t.boolean :life
      t.string :image_url

      t.timestamps
    end
  end
end
