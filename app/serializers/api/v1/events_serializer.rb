module Api
	module V1
		class EventsSerializer
			include ActiveModel::Serialization
	
			attr_accessor :start_date
			attr_accessor :end_date
			attr_accessor :text
			attr_accessor :status
		end
	end
end
