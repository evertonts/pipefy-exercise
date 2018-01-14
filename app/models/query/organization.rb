# Class responsible for generating the query string that is going
# to be used to query the Pipefy graphQL API to fetch the data for an
# organization.
module Query
  class Organization
    # Public: Returns the graphQL query string that is going to be used on
    # the Pipefy API
    #
    # Returns a String
    def query_string
      <<~GraphQL
      {
        organizations (ids: [92858]) {
          id
          name
          pipes (ids: [335557]) {
            id
            name
            start_form_fields {
              label
              id
            }
            phases {
              id
              name
              fields {
                label
                id
              }
              cards {
                edges {
                  node {
                    id
                    created_at
                    due_date
                    title
                    fields {
                      name
                      value
                    }
                  }
                }
              }
            }
          }
        }
      }
      GraphQL
    end
  end
end
