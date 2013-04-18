require 'spec_helper'

describe UsersController do

  let(:user) { User.create(:email => "testuser@goclio.com", :first_name => "Test", :last_name => "Person", 
                           :password => 'testtest', :password_confirmation => 'testtest') }

  before do
    sign_in user
  end

  describe "GET index" do
    before { get :index }
    it "should render the index template" do
      expect(response).to render_template("index")
    end
  end
  
end
