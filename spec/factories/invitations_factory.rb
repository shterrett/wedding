FactoryGirl.define do
  
  factory :invitation do
    principal_name "Stuart Terrett"
    street_address "13 Hickory Grove Point"
    city "Savannah"
    state "GA"
    zip "31405"
    honorific "Mr."
  end
  
  sequence :invitation do |n|
    principal_name "Person_#{n}"
    street_address "#{n} Hickory Grove Point"
    city "Savannah"
    state "GA"
    zip "31405"
    honorific "Mr."
  end
  
end
    
  
  