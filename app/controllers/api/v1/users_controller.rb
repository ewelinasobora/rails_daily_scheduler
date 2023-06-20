# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApiController
      def index
        users = User.all

        render json: users
      end
    end
  end
end
