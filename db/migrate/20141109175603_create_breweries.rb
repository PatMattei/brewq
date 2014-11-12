class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :website
      t.string :location

      t.timestamps
    end
  end
end
