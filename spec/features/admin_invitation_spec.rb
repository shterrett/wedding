require 'spec_helper'

feature "admin invitations views" do
  before(:all) { 30.times { FactoryGirl.create :invitation } }
  after(:all) { Invitation.delete_all }
  scenario "Visit Invitation Index" do
    visit '/admin/invitations'
    expect(page).to have_text "All Invitations"
    expect(page).to have_text "Stuart"
  end
end
