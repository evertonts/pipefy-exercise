# Class responsible for building an organization from the response of
# the Pipefy API
class OrganizationBuilder
  # Public: Creates organizations and the nested models from the Pipefy API response
  #
  # Returns Nothing
  def create_from_response!(attributes)
    organizations_attr = to_nested_attributes(attributes)

    ActiveRecord::Base.transaction do
      organizations_attr.each do |organization_attr|
        Organization.create!(organization_attr)
      end
    end
  end

  private

  # Internal: Adapt the Pipefy response to be able to use Rails nested attributes
  # to create the organization and its submodels. Also modify the id attribute to an
  # external_id
  #
  # Returns a Hash
  def to_nested_attributes(attributes)
    attrs = attributes.dup

    organizations = attrs[:data][:organizations]

    organizations.each do |organization|
      organization[:pipes].each do |pipe|
        pipe[:phases].each do |phase|
          phase[:cards] = phase[:cards][:edges].inject([]) do |buffer, edge|
            edge[:node][:external_id] = edge[:node].delete(:id)
            buffer << edge[:node]
          end

          phase[:cards_attributes] = phase.delete(:cards)
          phase[:external_id] = phase.delete(:id)
        end

        pipe[:phases_attributes] = pipe.delete(:phases)
        pipe[:external_id] = pipe.delete(:id)
      end

      organization[:pipes_attributes] = organization.delete(:pipes)
      organization[:external_id] = organization.delete(:id)
    end

    organizations
  end
end
