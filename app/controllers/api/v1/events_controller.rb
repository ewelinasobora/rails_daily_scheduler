# frozen_string_literal: true

module Api
  module V1
    class EventsController < ApiController
      def index
        events = Event.all

        render json: events
      end

      def create
        event = Event.new(text: params['text'], start_date: params['start_date'], end_date: params['end_date'],
                          user: current_user)
        if event.save
          render json: event, status: :created
        else
          render json: event.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
