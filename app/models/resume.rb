# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  display    :boolean
#  name       :string
#  objective  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Resume < ApplicationRecord

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id", counter_cache: true
  has_many  :experiences, class_name: "Experience", foreign_key: "resume_id", dependent: :destroy
  
end
