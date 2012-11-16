class Invitation < ActiveRecord::Base
  attr_accessible :city, :principal_name, :state, :street_address, :zip
  
  validates :principal_name, :street_address, :city, :state, :zip, presence: true, on: :update
  
  has_many :attendees
  accepts_nested_attributes_for :attendees
end
