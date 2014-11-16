class Review < ActiveRecord::Base
  include ActionView::Helpers::UrlHelper
  belongs_to :beer

  belongs_to :user


  def self.find_review(api_id)
    beer_db = Beer.find_by(api_id: "#{api_id}")['id'] 
    if Review.find_by(beer_id: "#{beer_db}")==nil 
      "No Reviews"
    else 
       Review.find_by(beer_id: "#{beer_db}")["body"]
    end 
  end

  def self.find_review_author(api_id)
    beer_db = Beer.find_by(api_id: "#{api_id}")['id'] 
    if Review.find_by(beer_id: "#{beer_db}")!=nil
      user = Review.find_by(beer_id: "#{beer_db}")['user_id']
      email = User.find("#{user}")['email']
      "By: #{email}"
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