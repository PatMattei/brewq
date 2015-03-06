class Beer < ActiveRecord::Base
  has_many :users, :through => :reviews

  has_many :reviews
  accepts_nested_attributes_for :reviews

  def self.get_from_api(abv, taste, color)
    json_file = RestClient.get("http://api.brewerydb.com/v2/beers/?format=json&key=#{ENV['BEER_DB_API_KEY']}&withBreweries=Y&abv=#{abv}&srm=#{color}&ibu=#{taste}")  
    JSON.parse(json_file)  
  end


  def self.check_db_for_beer(api_id)
    Beer.where(:api_id => "#{api_id}").blank?
  end

  def self.add_beer_to_db(beer_name, beer_brewery, beer_id, beer_style, beer_abv, beer_srm, beer_ibu, beer_description, beer_labels)
    Beer.create name:beer_name, brewery:beer_brewery, api_id:beer_id,  style:beer_style, abv:beer_abv, srm:beer_srm, ibu:beer_ibu, description:beer_description, label:beer_labels
  end
  
  def self.get_reviews
    if Review.where(:beer_id).blank?
      "Write the first review"
    else
      "Show Review"
    end
  end
end