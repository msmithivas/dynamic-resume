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

# require "openai"

def use_ai

openai_client = OpenAI::Client.new(
  access_token: ENV.fetch("OPENAI_TOKEN"),
  request_timeout: 240 # Optional parameter; increases the number of seconds before a request times out
)

@response = openai_client.chat(
    parameters: {
        model: "gpt-3.5-turbo", # Required. I recommend using gpt-3.5-turbo while developing, because it's a LOT cheaper than gpt-4
        messages: [
          { role: "system", content: "You are a corporate human resources recruiter that uses business jargon" },
          { role: "user", content: "Hello!"}
        ],
        temperature: 0.7,
    }
)

@the_response = response.fetch("choices").at(0)

end
