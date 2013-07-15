class CustomerServiceRep < ActiveRecord::Base
  # attr_accessible :title, :body
  has_one :user, as: :teammable
end
