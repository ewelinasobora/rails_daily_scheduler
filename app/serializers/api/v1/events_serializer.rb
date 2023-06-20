# frozen_string_literal: true

module Api
  module V1
    class EventsSerializer
      include ActiveModel::Serialization

      attr_accessor :start_date, :end_date, :text, :status
    end
  end
end
