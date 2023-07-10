# frozen_string_literal: true

require 'sidekiq-scheduler'

class WaterPlantEventWorker
  include Sidekiq::Worker

  def perform(*args)
    User.find_each do |user|
      if user.events.where(start_date: Time.zone.today, text: "Water your outdoor plants!")
        EventMailer.with(user: user).water_plant_mail.deliver_later
      end
    end
  end
end
