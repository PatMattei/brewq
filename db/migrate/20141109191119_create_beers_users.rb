class CreateBeersUsers < ActiveRecord::Migration
  def change
    create_table :beers_users do |t|
      t.integer :beer_id
      t.integer :user_id
    end
  end
end
