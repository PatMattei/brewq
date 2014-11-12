class ProfilesController < ApplicationController 
  before_action :authenticate_user!

  def profile
    
  end

  def brewery_db
    brewery_db.beers.all(abv: '5.5')
  end
end