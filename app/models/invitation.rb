class Invitation < ActiveRecord::Base
  attr_accessible :city, :principal_name, :state, :street_address, :zip, :honorific, :attendees_attributes
  
  # validates :principal_name, :street_address, :city, :state, :zip, presence: true, on: :update
  
  has_many :attendees
  accepts_nested_attributes_for :attendees
  
  def self.search(search)
    if search
      Invitation.where('principal_name LIKE ?', "%#{search}%").order(:principal_name)
    else
      Invitation.where('principal_name IS NOT NULL').order(:principal_name)
    end
  end
  
end
