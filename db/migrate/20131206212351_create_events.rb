class CreateEvents < ActiveRecord::Migration
  
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :organisation
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
ad