# == Schema Information
#
# Table name: employers
#
#  id         :integer          not null, primary key
#  jobs_count :integer
#  location   :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Employer < ApplicationRecord

  has_many  :jobs, class_name: "Job", foreign_key: "employer_id", dependent: :nullify
  
end
