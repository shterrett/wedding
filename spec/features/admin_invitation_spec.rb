require 'spec_helper'

feature "admin invitations views" do
  before(:all) do
    30.times do 
      FactoryGirl.create :invitation
    end
  end 
  let(:num) { Random.rand(0...30) }
  after(:all) { Invitation.delete_all }
  
  scenario "Visit Invitation Index" do
    visit '/admin/invitations'
    num
    expect(page).to have_text "All Invitations"
    expect(page).to have_link "Stuart_#{num}"
  end
  scenario "Search list" do
    visit '/admin/invitations'
    num
    other_num = num - 1
    fill_in "search", with: "Stuart_#{num}"
    click_button "Search"
    page.should have_link "Stuart_#{num}"
    page.should_not have_link "Stuart_#{other_num}"
  end
  scenario "click into invitation" do
    visit '/admin/invitations'
    num
    click_link "Stuart_#{num}"
    expect(page).to have_text "Stuart_#{num}"
  end
end
