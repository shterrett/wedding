class Attendee < ActiveRecord::Base
  attr_accessible :name, :email, :vegetarian
  
  validates :name, :email, :vegetarian, presence: true 
end
