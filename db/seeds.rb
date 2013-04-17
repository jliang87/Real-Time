10.times do |n|
  User.create(:email => "user#{n}@goclio.com", 
              :first_name => Faker::Name.first_name,
              :last_name => Faker::Name.last_name,
              :password => "testtest",
              :password_confirmation => "testtest", 
              :status => :out)
              
end
