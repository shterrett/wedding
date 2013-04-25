require 'spec_helper'

describe Invitation do
  let(:invitation) { Invitation.new }
  let(:attendee) { Attendee.new }
  subject { invitation }

  [:city, :principal_name, :state, :street_address, :zip, :honorific].each do |attr|
    it { should respond_to attr }
  end
  
  it "should have many attendees" do
    invitation.should respond_to :attendees
  end
  
  it "should return attendee" do 
    invitation.attendees << attendee
    invitation.attendees.should include(attendee)
  end
  
  it "should create an attendee" do
    sub_attendee = invitation.attendees.new
    invitation.attendees.should include(sub_attendee)
  end
  
  it "should search by name" do
    invitation_1 = Invitation.create(principal_name: "Stuart Terrett")
    invitation_2 = Invitation.create(principal_name: "Kate Gasaway")
    results = Invitation.search("Stuart")
    results.should include(invitation_1)
    results.should_not include(invitation_2)
  end
  
end
