require 'spec_helper'

feature "admin invitations views" do
  before(:all) do
    30.times do 
      FactoryGirl.create :invitation
    end
  end 
  let(:num) { Random.rand(1...30) }
  after(:all) { Invitation.delete_all }
  
  scenario "Visit Invitation#index" do
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

feature "admin create invitations" do
  scenario "Visit Invitation#new" do
    visit '/admin/invitations/new'
    expect(page).to have_text "Create an Invitation"
    expect(page).to have_field "Principal Name"
  end
  
  scenario "create a new invitation" do
    visit '/admin/invitations/new'
    fill_in "Honorific", with: "Mr."
    fill_in "Principal Name", with: "Stuart Terrett"
    fill_in "Street Address", with: "123 Test Rd."
    fill_in "City", with: "Savannah"
    fill_in "State", with: "GA"
    fill_in "Zip", with: 31405
    expect do
      click_button "Create Invitation"
    end.to change(Invitation, :count).by(1)
  end
    
end

feature "admin edit invitations" do
  scenario "Visit Invitation#edit" do
    invitation = FactoryGirl.create :invitation
    visit "/admin/invitations/#{invitation.id}/edit"
    expect(page).to have_text "Edit Invitation for #{invitation.principal_name}"
    expect(page).to have_field "Principal Name"
  end
  
  scenario "update invitation" do
    invitation = FactoryGirl.create :invitation
    id = invitation.id
    visit "/admin/invitations/#{invitation.id}/edit"
    fill_in "Principal Name", with: "Not in the pattern"
    expect do
      click_button "Update Invitation"
      invitation.reload
    end.to change(invitation, :principal_name).to("Not in the pattern")
  end
end

feature "admin view invitation" do
  scenario "Visit Invitation#show" do
    invitation = FactoryGirl.create :invitation
    visit "/admin/invitations/#{invitation.id}"
    expect(page).to have_text invitation.principal_name
    expect(page).to have_text invitation.street_address
    expect(page).to have_link("Edit", { href: "/admin/invitations/#{invitation.id}/edit" })
    expect(page).to have_link("Back to Index", { href: "/admin/invitations" })
  end
end
