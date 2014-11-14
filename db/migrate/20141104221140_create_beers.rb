class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.string :brewery
      t.string :api_id
      t.string :score
      t.string :style
      t.string :abv
      t.string :srm
      t.string :ibu
      t.string :tags
      t.string :description
      t.string :label

      t.timestamps
    end
  end
end