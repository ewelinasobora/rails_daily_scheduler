# frozen_string_literal: true

class CalendarController < ApplicationController
  def index; end

  def data
    events = Event.all

    render json: events.map { |event|
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
      event = Event.create start_date: start_date, end_date: end_date,
                           text: text, rec_type: rec_type,
                           event_length: event_length, event_pid: event_pid
      tid = event.id
      mode = 'deleted' if rec_type == 'none'

    when 'deleted'
      Event.where(event_pid: id).destroy_all if rec_type != ''

      if event_pid != 0 && event_pid != ''
        event = Event.find(id)
        event.rec_type = 'none'
        event.save
      else
        Event.find(id).destroy
      end

    when 'updated'
      Event.where(event_pid: id).destroy_all if rec_type != ''
      event = Event.find(id)
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
      tid: tid
    }
  end
  # rubocop:enable Style/CyclomaticComplexity
end
