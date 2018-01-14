class OrganizationsController < ApplicationController
  def index
    @organizations = []
  end

  def create
    client = PipefyClient.new
    query = { query: Query::Organization.new.query_string }

    response = client.query(query)

    @organizations = OrganizationBuilder.new.create_from_response!(response)

    render :index
  end
end
