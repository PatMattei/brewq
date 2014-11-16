class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :beers, :through => :reviews

  has_many :reviews

  def self.full_name
    "#{User.first_name} #{User.last_name}"
  end

end
