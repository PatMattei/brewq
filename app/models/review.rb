class Review < ActiveRecord::Base
  belongs_to :beer

  belongs_to :user


  def self.check_for_beer
  end
end
