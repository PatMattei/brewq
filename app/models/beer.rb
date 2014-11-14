class Beer < ActiveRecord::Base
  has_many :users, :through => :reviews

  has_many :reviews


  def self.show_label
    beer = Beer.find(params[:id])
    print 
  end

  def self.get_from_api(abv, taste, color)
    json_file = RestClient.get("http://api.brewerydb.com/v2/beers/?format=json&key=#{ENV['BEER_DB_API_KEY']}&withBreweries=Y&abv=#{abv}&srm=#{color}&ibu=#{taste}")  
    JSON.parse(json_file)  
  end

  def self.check_db_for_beer(api_id)
    Beer.where(:api_id => "#{api_id}").blank?
  end

  def self.get_reviews
    if Review.where(:beer_id).blank?
      "Write the first review"
    else
      "Show Review"
    end
  end
end