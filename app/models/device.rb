class Device < ActiveRecord::Base
  attr_accessible :token

  belongs_to :address
end
