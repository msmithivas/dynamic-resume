# == Schema Information
#
# Table name: experiences
#
#  id            :integer          not null, primary key
#  description   :string
#  display_order :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  job_id        :integer
#  resume_id     :integer
#
class Experience < ApplicationRecord

  belongs_to :job, class_name: "Job", foreign_key: "job_id"
  belongs_to :resume, required: true, class_name: "Resume", foreign_key: "resume_id"
  
end
