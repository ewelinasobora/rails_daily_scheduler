FactoryBot.define do
  factory :user do
    email { Faker::TvShows::TheITCrowd.email }
  end
end
