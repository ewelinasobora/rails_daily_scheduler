# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    start_date { '2022-10-13 14:19:48' }
    end_date { '2022-10-13 14:19:48' }
    text { 'MyString' }
    status { 0 }
    user { create(:user) }
  end
end
