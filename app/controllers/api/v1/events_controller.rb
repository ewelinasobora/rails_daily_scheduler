module Api
	module V1
		class EventsController < ApiController

			def index
				events = Event.all

				render json: events, serializer: Api::V1::EventsSerializer
			end

			def create
				event = Event.create!(text: params["text"], start_date: params["start_date"], end_date: params["end_date"], user: current_user)

				render json: event.to_json
			end
		end
	end
end
