# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session, if: proc { |c| c.request.format =~ %r{application/json} }
  before_action :authenticate_user!
end
