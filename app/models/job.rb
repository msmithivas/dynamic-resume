# == Schema Information
#
# Table name: jobs
#
#  id          :integer          not null, primary key
#  description :text
#  end_date    :date
#  skills      :text
#  start_date  :date
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employer_id :integer
#
class Job < ApplicationRecord

  has_many  :experiences, class_name: "Experience", foreign_key: "job_id", dependent: :nullify
  belongs_to :employer, class_name: "Employer", foreign_key: "employer_id", counter_cache: true
  
end
