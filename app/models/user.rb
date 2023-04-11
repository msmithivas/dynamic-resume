# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  address         :text
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  resumes_count   :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many  :resumes, class_name: "Resume", foreign_key: "user_id", dependent: :destroy
  
end
