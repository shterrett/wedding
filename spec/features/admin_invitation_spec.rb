require 'spec_helper'

feature "admin invitations views" do
  before(:all) { 30.times { FactoryGirl.create :invitation } }
  let(:num) { Random.rand(0...30) }
  after(:all) { Invitation.delete_all }
  scenario "Visit Invitation Index" do
    num
    visit '/admin/invitations'
    expect(page).to have_text "All Invitations"
    expect(page).to have_link "Stuart_#{num}"
  end
  scenario "click into invitation" do
    num
    visit '/admin/invitations'
    click_link "Stuart_#{num}"
    expect(page).to have_text "Stuart_#{num}"
  end
end
