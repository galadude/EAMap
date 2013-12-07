class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :organisation
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
