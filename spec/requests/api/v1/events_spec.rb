require 'swagger_helper'

describe 'Events', :json_api do
  let(:event) { create(:event) }

  path '/api/v1/events' do
  get "List all events" do
    tags "Events"
    security [bearer: []]
    consumes "application/json"
    produces 'application/json'

  response '200', 'Lists found' do
    schema type: :array,
           items: {
             type: :object,
             properties: {
               id: { type: :integer },
               text: { type: :string },
               created_at: { type: :datetime},
               updated_at: { type: :datetime}
             }
           }
    run_test!
          end
        end
      end


    # parameter name: "organisation_uids[]",
    #           in: :query,
    #           description: "List of organisations UIDs to filter by.
    #                         If empty, users from all accessible organisations
    #                         will be returned.",
    #           type: :array,
    #           items: { "$ref": "#/definitions/uid" },
    #           collectionFormat: :multi

    # parameter name: :"ordering[by]",
    #       in: :query,
    #       type: :string,
    #       description: "Order by"
    # parameter name: :"ordering[direction]",
    #       in: :query,
    #       type: :string,
    #       description: "Order direction",
    #       enum: %w[asc desc]
    # parameter name: :"pagination[per_page]",
    #       in: :query,
    #       type: :integer,
    #       description: "Number of items per page"
    # parameter name: :"pagination[page_number]",
    #       in: :query,
    #       type: :integer,
    #       description: "Number of page returned"
    # parameter name: :query,
    #           in: :query,
    #           type: :array,
    #           collectionFormat: :ssv,
    #           items: {
    #             type: :string
    #           },
    #           description: "List of filtering parameters Query parameters,
    #                         add in AND or OR within the fields as you see fit.
    #                         Possible values:\n
    #                         AND, OR, NOT, with_project:{project_name} or\n
    #                         created_at:{20/10/2018|24/10/2018}, name=~{org_name}"

#     let("organisation_uids[]") { [] }

#     let(:query) do
#       [
#         "created_at:{20/10/2018|24/10/2018}", "AND",
#         "with_project:{project_name}", "AND", "with_user_name:{john smith}",
#         "AND", "name=~{org_name}"
#       ].map! { |s| CGI.escape(s) }
#     end

#     let(:"pagination[per_page]") { 25 }
#     let(:"ordering[by]") { "id" }
#     let(:"ordering[direction]") { "DESC" }
#     let(:"pagination[per_page]") { 25 }
#     let(:"pagination[page_number]") { 1 }

#     response "200", "successful users response" do
#       let(:Authorization) { auth_headers.fetch("AUTHORIZATION").to_s }

#       schema "$ref" => "#/definitions/user_list"
#       run_test!
#     end
#   end
# end
end
# describe 'Events', :json_api do
#   let(:event) { create(:event) }

#   path '/api/v1/events' do
#     get 'List events' do
#       tags 'Events'
#       security [bearer: []]
#       consumes 'application/json'
#       parameter name: :event, in: :query, schema: {
#         type: :object,
#         properties: {
#           start_date: { type: :date },
#           end_date: { type: :date },
#           text: { type: :string },
#           status: { type: :string }
#         },
#         required: [ 'start_date', 'end_date', 'text' ]
#       }

#       response '200', 'event created' do
#         run_test!
#       end

#       response '422', 'invalid request' do
#         run_test!
#       end
#     end
#   end
# end
