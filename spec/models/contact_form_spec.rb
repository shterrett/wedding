require 'spec_helper'

describe ContactForm do
  let(:contact_form) { ContactForm.new }
  let(:valid_contact_form) do
    ContactForm.new(name: "Stuart", email: "stuart@example.com", body: "Test")
  end
    
  
  subject { contact_form }
  
  [:name, :email, :body].each do |attr|
    it { should respond_to attr }
  end
  
  it "should validate name, email, and body" do
    contact_form.should_not be_valid
    valid_contact_form.should be_valid
  end
  
end
