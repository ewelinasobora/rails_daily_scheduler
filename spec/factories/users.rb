# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::TvShows::TheITCrowd.email }
    password { SecureRandom.base64(10) }
  end
end
