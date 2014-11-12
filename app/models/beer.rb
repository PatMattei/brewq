class Beer < ActiveRecord::Base
  has_many :users, :through => :reviews

  has_many :reviews

  belongs_to :brewery


  def self.access_db
    json_file = RestClient.get('http://api.brewerydb.com/v2/styles/?format=json&key=2fbdec68dd2a53cc1eb4689cbeb3fdf6')  
    parsed_file = JSON.parse(json_file)    
    parsed_file
  end


  #http://api.brewerydb.com/v2/beers?abv=5,8&format=json&key=2fbdec68dd2a53cc1eb4689cbeb3fdf6

  def self.list_by_style
    access_db
    parsed_file = access_db
    data = parsed_file['data']

    styles = []
    data.each do |beer_info|
      styles << beer_info['name'] 
    end


  def self.search
    json_file = RestClient.get('http://api.brewerydb.com/v2/beers?format=json&key=2fbdec68dd2a53cc1eb4689cbeb3fdf6')  
    parsed_file = JSON.parse(json_file)    
  end
end
