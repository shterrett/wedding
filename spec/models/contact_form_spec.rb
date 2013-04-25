require 'spec_helper'

describe ContactForm do
  let(:contact_form) { ContactForm.new }
  subject { contact_form }
  
  [:name, :email, :body].each do |attr|
    it { should respond_to attr }
  end
  
  it "should validate name, email, and body" do
    contact_form.should_not be_valid
    contact_form.name = "Stuart"
    contact_form.email = "stuart@example.com"
    contact_form.body = "Test"
    contact_form.should be_valid
  end
  
  it "should send email if valid" do
    pending
  end
  
end
