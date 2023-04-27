# frozen_string_literal: true

require "swagger_helper"

RSpec.describe "Project Controller API", :json_api do
  include_context :for_bst_projects

  let(:project) do
    setting = create(:bst_project_setting, zone: zn_eu, zones: [zn_eu])
    create(:bst_project, setting: setting)
  end

  before do
    project_group
    BST::Media.reindex
    BST::Project.reindex
  end

  path "/projects" do
    get "Get projects" do
      tags "Project"
      security [bearer: []]
      produces "application/json"

      parameter name: :query,
                in: :query,
                type: :array,
                collectionFormat: :ssv,
                items: {
                  type: :string
                },
                description: "List of filtering parameters Query parameters,
                              add in AND or OR within the fields as you see fit.
                              Possible values:\n
                              AND, OR, NOT, uid:{krzwne tim4ao kwbrjt} or\n
                              uid:{krzwne, tim4ao, kwbrjt},\n
                              name:{Behavioural Project},\n
                              with_organisation:{Organisation Name},\n"

      let(:query) do
        [
          "uid:{krzwne tim4ao kwbrjt}", "AND", "uid:{krzwne, tim4ao, kwbrjt}",
          "name:{Zoe}"
        ].map! { |s| CGI.escape(s) }
      end

      parameter name: :"ordering[by]",
                in: :query,
                type: :string,
                description: "Order by"

      parameter name: :"ordering[direction]",
                in: :query,
                type: :string,
                description: "Order direction",
                enum: %w[asc desc]

      parameter name: :scope,
                in: :query,
                type: :string,
                description: "scope of projects to be returned",
                enum: %w[all bookmarked recently_visited]

      parameter name: :"pagination[per_page]",
                in: :query,
                type: :integer,
                description: "Number of items per page"

      parameter name: :"pagination[page_number]",
                in: :query,
                type: :integer,
                description: "Number of page returned"

      let(:"ordering[by]") { "name" }
      let(:scope) { "all" }
      let(:"ordering[direction]") { "desc" }
      let(:"pagination[per_page]") { 25 }
      let(:"pagination[page_number]") { 1 }

      response "200", "projects found" do
        let(:Authorization) { auth_headers.fetch("AUTHORIZATION").to_s }

        schema "$ref" => "#/definitions/projects"

        run_test!
      end
    end