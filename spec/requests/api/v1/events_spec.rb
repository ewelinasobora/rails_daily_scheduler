# frozen_string_literal: true

require 'swagger_helper'

describe 'Events', :json_api do
  let(:current_user) { create(:user) }

  before { current_user }

  path '/api/v1/events' do
    get 'List all events' do
      let(:event) { create(:event) }

      tags 'Events'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'

      response '200', 'Lists found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string },
                   start_date: { type: :datetime },
                   end_date: { type: :datetime },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
               }
        run_test!
      end
    end

    post 'Creates an event' do
      tags 'Events'
      security [bearer: []]
      consumes 'application/json'
      produces 'application/json'
      parameter name: :text,
                in: :formData,
                description: 'Text',
                required: true,
                type: :string

      parameter name: :start_date,
                in: :formData,
                description: 'Start Date',
                required: true,
                type: :date

      parameter name: :end_date,
                in: :formData,
                description: 'End Date',
                required: true,
                type: :date

      let(:text) { 'test' }
      let(:start_date) { Date.yesterday }
      let(:end_date) { Time.zone.today }

      response '200', 'Event Created' do
        schema type: :object,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   text: { type: :string },
                   created_at: { type: :datetime },
                   updated_at: { type: :datetime }
                 }
               }
        run_test!
      end
    end
  end
end

# post 'Creates a blog' do
#   tags 'Blogs'
#   consumes 'application/json'
#   parameter name: :blog, in: :body, schema: {
#     type: :object,
#     properties: {
#       title: { type: :string },
#       content: { type: :string }
#     },
#     required: [ 'title', 'content' ]
#   }

#   response '201', 'blog created' do
#     let(:blog) { { title: 'foo', content: 'bar' } }
#     run_test!
#   end

#   response '422', 'invalid request' do
#     let(:blog) { { title: 'foo' } }
#     run_test!
#   end
# end
