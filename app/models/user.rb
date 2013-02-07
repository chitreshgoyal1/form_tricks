class User < ActiveRecord::Base
  attr_accessible :name, :preferences, :title, :active
  serialize :preferences
end
