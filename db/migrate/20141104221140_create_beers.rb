class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :score
      t.string :style
      t.string :year
      t.string :abv
      t.string :tags
      t.string :description

      t.timestamps
    end
  end
end
