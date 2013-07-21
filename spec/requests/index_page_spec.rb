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
      user.save
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
      user.save
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
      user.save
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
      user.save
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
      user.save
      fill_in "Email", with: email
      fill_in "Password", with: password
      click_button "Sign in"
    end

    it {should have_content('Software Quality Assurance')}
  end

end

