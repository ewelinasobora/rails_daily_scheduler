# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'example@e-dot.uk' }
    password { SecureRandom.base64(10) }
  end
end
