class Review < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper
  belongs_to :beer

  belongs_to :user



  def self.get_author(beer_db)
      author_id = Review.find_by(beer_id: "#{beer_db}")["user_id"]
      User.find(author_id)["email"]
  end

  

  def self.find_review(api_id)
    beer_db = Beer.find_by(api_id: "#{api_id}")['id'] 
    if Review.find_by(beer_id: "#{beer_db}")==nil 
      "No Reviews Yet"
    else
      "Author: #{Review.get_author(beer_db)}, 
      BODY:  #{Review.find_by(beer_id: "#{beer_db}")["body"]}"
    end 
  end


  def self.create_review(api_id, user_id)
    beer_db = Beer.find_by(api_id: "#{api_id}")['id']

    if Review.find_by_user_id_and_beer_id("#{user_id}", "#{beer_db}")
      review = Review.find_by_user_id_and_beer_id("#{user_id}", "#{beer_db}")["body"]
        "Your Review: #{review}"
    else
        "Leave a new review: BUTTON"
    end
  end
end