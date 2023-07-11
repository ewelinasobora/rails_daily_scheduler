# frozen_string_literal: true

class EventController < ApplicationController
  def get
    events = Event.where(user_id: current_user.id)

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
        format.json { render json: @event, tid: @event.id, action: 'inserted', status: :ok }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def fetch_weatherapi
    ForecastResource.new(params[:location]).weekly.each do |date, rain|
      if rain
        events = Event.where(start_date: date.beginning_of_day, end_date: date.end_of_day, user: current_user, text: 'Water your outdoor plants!')
        events.delete_all if events.present?
      else
        Event.where(start_date: date.beginning_of_day, end_date: date.end_of_day, user: current_user,
                      text: 'Water your outdoor plants!').first_or_create
      end
    end

    render json: { action: 'weatherapi-fetched', status: :ok }
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
