class User < ActiveRecord::Base
  attr_accessor :vendor_identifier

  has_many :devices
  has_many :comments
  has_many :items
  has_many :likes
end
