class Mark < ActiveRecord::Base
  attr_accessible :grade, :m_marks, :obtain_marks, :remarks, :student_id, :subject_id
end
