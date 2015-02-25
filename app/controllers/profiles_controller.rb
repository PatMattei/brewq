class ProfilesController < ApplicationController 

  def show  
  end

  def search_beer
    @beers = Beer.get_from_api(params['beer']['abv'], params['beer']['taste'], params['beer']['color'])['data'].sample(3)
    
    render :show
  end
end