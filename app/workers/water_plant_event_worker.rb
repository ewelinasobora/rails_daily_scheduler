# frozen_string_literal: true

require 'sidekiq-scheduler'

class WaterPlantEventWorker
  include Sidekiq::Worker

  def perform
    User.find_each do |user|
      user_events = user.events
      EventMailer.with(user:).water_plant_mail.deliver_later if user_events.where(published: true).present?
      user_events.update(schedule: true)
    end
  end
end
