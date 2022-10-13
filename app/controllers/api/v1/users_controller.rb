module Api
	module V1
		class UsersController < Api::V1::ApiController
			def index
				users = User.all
				
				render json: users, serializer: Api::V1::UsersSerializer
			end
		end
	end
end
