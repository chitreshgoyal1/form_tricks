class User < ActiveRecord::Base
  attr_accessible :name, :preferences, :title, :active, :count
  serialize :preferences
  has_many :photos, :foreign_key => 'usr_id', :primary_key => 'ph_id'
end
