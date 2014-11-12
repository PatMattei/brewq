class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :user_id
      t.string :beer_id
      t.text :body
      t.string :score

      t.timestamps
    end
  end
end
