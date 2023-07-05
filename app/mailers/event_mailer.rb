# frozen_string_literal: true

class EventMailer < ApplicationMailer
  default from: 'e@e-dot.uk'

  def created_event_mail
    @user = params[:user]
    @url  = '/'
    mail(to: @user.email, subject: 'Your event has been created')
  end
end
