# frozen_string_literal: true

class EventController < ApplicationController
  def get
    events = Event.all

    render json: events.map { |event|
                   {
                     id: event.id,
                     start_date: event.start_date.to_formatted_s(:db),
                     end_date: event.end_date.to_formatted_s(:db),
                     text: event.text
                   }
                 }
  end

  def add
    @event = Event.new(
      text: params['text'],
      start_date: params['start_date'],
      end_date: params['end_date'],
      user: current_user
    )

    respond_to do |format|
      if @event.save

        # Tell the UserMailer to send a welcome email after save
        # NewEventNotification.with(event: @event).deliver(current_user)
        # binding.b
        # EventMailer.with(user: current_user).welcome_email.deliver_later

        # format.html { redirect_to(@event, notice: 'Event saved successfully') }
        # render json: { action: 'inserted', tid: @event.id }
        format.json { render json: @event, tid: @event.id, status: :ok }
      else
        # format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    event = Event.find(params['id'])
    event.text = params['text']
    event.start_date = params['start_date']
    event.end_date = params['end_date']
    event.save!

    render json: { action: 'updated' }
  end

  def delete
    Event.find(params['id']).destroy

    render json: { action: 'deleted' }
  end
end
