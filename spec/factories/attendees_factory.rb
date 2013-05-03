FactoryGirl.define do
  factory :attendee do
    sequence(:name) { |n| "Attendee_#{n}" }
    sequence(:email) { |n| "attendee_#{n}@example.com" }
    sequence(:vegetarian) { |n| n % 3 == 0 ? true : false }
    sequence(:attending) { |n| n % 4 == 0 ? false : true }
    message "Hi!"
    invitation
  end
end