require 'spec_helper'

describe UsersController do

  let(:user) { create(:user) }

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
