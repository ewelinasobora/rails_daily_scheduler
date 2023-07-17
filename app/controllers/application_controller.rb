# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: proc { |content_type| content_type.request.format =~ %r{application/json} }
  before_action :authenticate_user!
end
