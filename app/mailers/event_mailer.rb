# frozen_string_literal: true

class EventMailer < ApplicationMailer
  default from: 'e@e-dot.uk'

  def water_plant_mail
    @user = params[:user]

    @url  = '/'
    mail(to: @user.email, subject: "It's time to water your plants!")
  end
end
