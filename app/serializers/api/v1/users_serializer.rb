# frozen_string_literal: true

module Api
  module V1
    class UsersSerializer
      include ActiveModel::Serialization

      attr_accessor :email, :created_at, :updated_at
    end
  end
end
