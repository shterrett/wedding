FactoryGirl.define do
  
  factory :invitation do
    sequence(:principal_name) { |n| "Stuart_#{n}"}
    street_address "13 Hickory Grove Point"
    city "Savannah"
    state "GA"
    zip "31405"
    honorific "Mr."
  end
  
end
    
  
  