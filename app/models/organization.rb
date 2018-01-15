class Organization < ApplicationRecord
  has_many :pipes, dependent: :destroy

  #Public: Create or update organizations and it's structure from the
  # Pipefy API
  #
  # Returns an Array
  def self.create_or_update_from_pipefy_api
    client = PipefyClient.new
    query = { query: ::Query::Organization.new.query_string }

    response = client.query(query)

    OrganizationBuilder.new.create_from_response!(response)
  end
end
