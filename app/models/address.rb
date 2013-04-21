class Address < ActiveRecord::Base
  attr_accessible :address

  has_many :devices
end
