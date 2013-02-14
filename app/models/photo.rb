class Photo < ActiveRecord::Base
  attr_accessible :id, :name, :usr_id
  belongs_to :user, :primary_key=>"id", :foreign_key=>"usr_id"
end
