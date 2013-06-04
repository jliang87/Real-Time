require 'spec_helper'

describe User do

  let(:user) { create(:user) }

  describe "#status=" do
    before do
      user.status= status
    end
    
    context "when given an accepted value" do
      let(:status) { :in }
      it "should write the enumerated value in the database" do
        expect(user.send(:read_attribute, :status)).to eql User::STATUSES[status]
      end      
    end
    
    context "when given an unaccepted value" do
      let(:status) { :bad_status }
      it "should write nil in the database" do
        expect(user.send(:read_attribute, :status)).to be_nil
      end      
      
    end


  end

end
