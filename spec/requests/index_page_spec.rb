require 'spec_helper'


#describe "Check teams for user" do
#  subject {page}
#
#  describe "Check accountant" do
#    let(:user) { FactoryGirl.create(:user) }
#    let(:email) {user.email}
#    let(:password) {user.password}
#
#    before {visit root_path}
#    before do
#      user.teammable = Accountant.create!
#      user.save!
#      fill_in "Email", with: email
#      fill_in "Password", with: password
#      click_button "Sign in"
#    end
#
#    it {should have_content('Accounting')}
#  end
#
#  describe "Check customer service rep" do
#    let(:user) { FactoryGirl.create(:user) }
#    let(:email) {user.email}
#    let(:password) {user.password}
#
#    before {visit root_path}
#    before do
#      user.teammable = CustomerServiceRep.create!
#      user.save!
#      fill_in "Email", with: email
#      fill_in "Password", with: password
#      click_button "Sign in"
#    end
#
#    it {should have_content('Customer Service')}
#  end
#
#  describe "Check sales person" do
#    let(:user) { FactoryGirl.create(:user) }
#    let(:email) {user.email}
#    let(:password) {user.password}
#
#    before {visit root_path}
#    before do
#      user.teammable = Salesperson.create!
#      user.save!
#      fill_in "Email", with: email
#      fill_in "Password", with: password
#      click_button "Sign in"
#    end
#
#    it {should have_content('Sales')}
#  end
#
#  describe "Check software developer" do
#    let(:user) { FactoryGirl.create(:user) }
#    let(:email) {user.email}
#    let(:password) {user.password}
#
#    before {visit root_path}
#    before do
#      user.teammable = SoftwareDeveloper.create!
#      user.save!
#      fill_in "Email", with: email
#      fill_in "Password", with: password
#      click_button "Sign in"
#    end
#
#    it {should have_content('Software Development')}
#  end
#
#  describe "Check software tester" do
#    let(:user) { FactoryGirl.create(:user) }
#    let(:email) {user.email}
#    let(:password) {user.password}
#
#    before {visit root_path}
#    before do
#      user.teammable = SoftwareTester.create!
#      user.save!
#      fill_in "Email", with: email
#      fill_in "Password", with: password
#      click_button "Sign in"
#    end
#
#    it {should have_content('Software Quality Assurance')}
#  end
#
#end


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

  describe "Click on Edit to change status to 'out'" do
    before do
      #click_link "Edit"
      #select('out', from: 'My Status')
      #click_button "Save"
      users[2].status = 'out'
      users[2].save!
      sleep 6.seconds
      #click_link('update-'+users[2].id.to_s)
    end

    it "Should change user status to 'out'", js: true do

      save_and_open_page
    end
  end

end


