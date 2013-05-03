FactoryGirl.define do
  
  factory :invitation do
    sequence(:principal_name) { |n| "Stuart_#{n}"}
    street_address "13 Hickory Grove Point"
    city "Savannah"
    state "GA"
    zip "31405"
    honorific "Mr."
  
    factory :invitation_with_attendees do
      ignore do
        attendee_count 4
      end
      
      after(:create) do |invitation, evaluator| 
        FactoryGirl.create_list(:attendee, evaluator.attendee_count, invitation: invitation)
      end
    end
  
  end
  
end
    
  
  