# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalendarController do
  # include Warden::Spec::Helpers

  describe 'GET index' do
    render_views

    let(:user) { FactoryBot.create(:user) }

    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, email: 'test@e-dot.uk')
    end

    xit 'renders the index template' do
      get :index
      expect(response).to render_template :index
    end

    xit 'tests index' do
      events = [FactoryBot.create(:event, user:)]

      get :index
      expect(assigns(:events)).to eq events
    end
  end
end
