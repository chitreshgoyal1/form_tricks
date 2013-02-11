class User < ActiveRecord::Base
  attr_accessible :name, :preferences, :title, :active, :count
  serialize :preferences
end
