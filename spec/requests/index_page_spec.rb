require 'spec_helper'


describe "Check teams for user" do
  subject {page}

  describe "Check accountant" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) {user.email}
    let(:password) {user.password}

    before {visit root_path}
    before do
      user.teammable = Accountant.create!
      user.save!
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Accounting')}
  end

  describe "Check customer service rep" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) {user.email}
    let(:password) {user.password}

    before {visit root_path}
    before do
      user.teammable = CustomerServiceRep.create!
      user.save!
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Customer Service')}
  end

  describe "Check sales person" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) {user.email}
    let(:password) {user.password}

    before {visit root_path}
    before do
      user.teammable = Salesperson.create!
      user.save!
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Sales')}
  end

  describe "Check software developer" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) {user.email}
    let(:password) {user.password}

    before {visit root_path}
    before do
      user.teammable = SoftwareDeveloper.create!
      user.save!
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Software Development')}
  end

  describe "Check software tester" do
    let(:user) { FactoryGirl.create(:user) }
    let(:email) {user.email}
    let(:password) {user.password}

    before {visit root_path}
    before do
      user.teammable = SoftwareTester.create!
      user.save!
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Software Quality Assurance')}
  end

end

# can use launchy gem's save_and_open_page to open up webpage
describe "Check changing statuses" do
  subject {page}
  let(:users) { FactoryGirl.create_list(:user, 10) }
  let(:email) {users[1].email}
  let(:password) {users[1].password}

  before {visit root_path}
  before do
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Sign in"
  end

  describe "Click on Edit to change current user status to 'out'" do
    before do
      click_link "Edit"
      select('out', from: 'My Status')
      click_button "Save"
    end

    it "Should change current user status to 'out'" do
      should have_css '#user-'+ users[1].id.to_s + ' span.status-out', text: 'out'
      should have_css '#user-'+ users[3].id.to_s + ' span.status-in', text: 'in'
    end
  end

  describe "Simulate near-real-time update of statuses changes" do
    before do
      users[2].status = 'out'
      users[2].save!
      users[5].status = 'out'
      users[5].save!
      sleep 6.seconds # need to wait for the callbacks in user.js.coffee for it takes that long for them to run
    end

    it "Should see users statuses change to 'out'", js: true do
      should have_css '#user-'+ users[2].id.to_s + ' span.status-out', text: 'out'
      should have_css '#user-'+ users[5].id.to_s + ' span.status-out', text: 'out'
      should have_css '#user-'+ users[9].id.to_s + ' span.status-in', text: 'in'
    end
  end

  describe "Click on Update to check the statuses other users" do
    before do
      users[6].status = 'out'
      users[6].save!
      click_link('update-'+users[8].id.to_s)
      click_link('update-'+users[6].id.to_s)
      click_link('update-'+users[7].id.to_s)
    end

    it "Should see users statuses changes", js: true do
      should have_css '#user-'+ users[8].id.to_s + ' span.status-in', text: 'in'
      should have_css '#user-'+ users[6].id.to_s + ' span.status-out', text: 'out'
      should have_css '#user-'+ users[7].id.to_s + ' span.status-in', text: 'in'
    end
  end

end

#describe "Check user sign up" do
#  subject {page}
#
#  before {visit root_path}
#  before do
#    fill_in "Email", with: email
#    fill_in "Password", with: password
#    click_button "Sign in"
#  end
#
#end



