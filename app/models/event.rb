# frozen_string_literal: true

class Event < ApplicationRecord
  enum status: {
    incomplete: 0,
    complete: 1
  }

  belongs_to :user

  scope :by_location, ->(location) { joins(:user).where(users: { location:}) }
  scope :enabled, -> { where(disable: false) }
  scope :disabled, -> { where(disable: true) }
  scope :incomplete, -> { where(status: 'incomplete') }
  scope :current_day, -> { where(start_date: Date.current.beginning_of_day) }
end
