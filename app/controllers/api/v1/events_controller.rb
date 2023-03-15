module Api
	module V1
		class EventsController < ApiController
			
			def index
				events = Event.all
				
				render json: events, serializer: Api::V1::EventsSerializer
			end
		end
	end
end
