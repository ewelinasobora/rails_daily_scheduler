# frozen_string_literal: true

class CalendarController < ApplicationController
  def index
    @events = current_user.events
  end

  def data
    render json: @events.map { |event|
                   {
                     id: event.id,
                     start_date: event.start_date.to_formatted_s(:db),
                     end_date: event.end_date.to_formatted_s(:db),
                     text: event.text,
                     rec_type: event.rec_type,
                     event_length: event.event_length,
                     event_pid: event.event_pid
                   }
                 }
  end

  # rubocop:disable Style/CyclomaticComplexity
  def db_action
    events = Event.where(event_pid: id)
    events.destroy_all if rec_type != ''

    mode = params['!nativeeditor_status']
    id = params['id']
    start_date = params['start_date']
    end_date = params['end_date']
    text = params['text']
    rec_type = params['rec_type']
    event_length = params['event_length']
    event_pid = params['event_pid']
    tid = id

    case mode
    when 'inserted'
      event = Event.create(start_date:, end_date:, text:, rec_type:,
                           event_length:, event_pid:)
      tid = event.id
      mode = 'deleted' if rec_type == 'none'

    when 'deleted'
      if event_pid != 0 && event_pid != ''
        event = @event
        event.rec_type = 'none'
        event.save
      else
        @event.destroy
      end

    when 'updated'
      event = @event
      event.start_date = start_date
      event.end_date = end_date
      event.text = text
      event.rec_type = rec_type
      event.event_length = event_length
      event.event_pid = event_pid
      event.save
    end

    render json: {
      type: mode,
      sid: id,
      tid:
    }
  end
  # rubocop:enable Style/CyclomaticComplexity

  def event
    @event =  Event.find(params["id"])
  end
end
