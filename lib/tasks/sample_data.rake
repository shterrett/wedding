namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    inv = Invitation.create!(principal_name: "Example Invitation",
                        street_address: "13 Hickory Grove Point",
                        city: "Savannah",
                        state: "GA",
                        zip: "31405",
                        honorific: "Mr.")
                        attending = lambda { Random.rand(0..3) == 3 ? false : true }
                        vegetarian = lambda { Random.rand(0..3) == 3 ? true : false }
    atnd = Attendee.create!(name: "Example User",
                      email: "attendee@example.com",
                      attending: attending,
                      vegetarian: vegetarian,
                      message: "blah blah blah", 
                      )
    inv.attendees << atnd
    99.times do |n|
      principal_name = Faker::Name.name
      street_address = "#{n} Hickory Grove Point"
      city = "Savannah"
      state = "GA"
      zip = "31405"
      honorific = "Mr."
      inv = Invitation.create!(principal_name: principal_name,
                          street_address: street_address,
                          city: city,
                          state: state,
                          zip: zip,
                          honorific: honorific
      )
      4.times do |m|
        name = Faker::Name.name
        attending = lambda { Random.rand(0..3) == 3 ? false : true }
        vegetarian = lambda { Random.rand(0..3) == 3 ? true : false }
        message = "blah blah blah"
        atnd = Attendee.create!(name: name,
                          attending: attending,
                          vegetarian: vegetarian,
                          message: message,
                          )
        inv.attendees << atnd
      end
    end
  end
end
      
