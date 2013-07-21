FactoryGirl.define do

  factory :user do
    sequence(:email){|n| "testuser#{n}@goclio.com" }
    sequence(:first_name) {|n| "Test#{n}"}
    last_name "Person"
    password "testtest"
    password_confirmation "testtest"
    sequence(:teammable) {|n| ClioInOutStub::TEAMMABLE[ClioInOutStub::TEAMS[n%5]].constantize.create! }
  end

end
