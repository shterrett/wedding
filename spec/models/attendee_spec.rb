require 'spec_helper'

describe Attendee do
  let(:attendee) { Attendee.new }
  subject { attendee }
  
  [:name, :email, :vegetarian, :attending, :message].each do |attr|
    it { should respond_to attr }
  end
  
  it "should belong_to invitation" do
    inv = Invitation.create
    inv.attendees << attendee
    attendee.invitation.should == inv
  end
  
  
end
