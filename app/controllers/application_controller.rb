class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :reset_session, prepend: true
  before_action :authenticate_user!
end
