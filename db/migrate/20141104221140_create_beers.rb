class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.text :name
      t.text :brewery
      t.text :api_id
      t.text :score
      t.text :style
      t.text :abv
      t.text :srm
      t.text :ibu
      t.text :tags
      t.text :description
      t.text :label

      t.timestamps
    end
  end
end