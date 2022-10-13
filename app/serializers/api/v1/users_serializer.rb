module Api
	module V1
		class UsersSerializer
			include ActiveModel::Serialization
			
			attr_accessor :email
			attr_accessor :created_at
			attr_accessor :updated_at
		end
	end
end
