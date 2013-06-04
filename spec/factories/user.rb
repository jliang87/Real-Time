FactoryGirl.define do

  factory :user do
    sequence(:email){|n| "testuser#{n}@goclio.com" }
    first_name "Test"
    last_name "Person"
    password "testtest"
    password_confirmation "testtest"
  end

end
