# Class responsible for building an organization from the response of
# the Pipefy API
class OrganizationBuilder
  # Public: Creates organizations and the nested models from the Pipefy API response
  #
  # Returns an Array
  def create_from_response!(attributes)
    organizations = attributes[:data][:organizations].deep_dup

    ActiveRecord::Base.transaction do
      organizations.map do |organization_attr|
        organization = create_organization(organization_attr)

        organization_attr[:pipes].each do |pipe_attr|
          pipe = create_pipe(organization, pipe_attr)

          pipe_attr[:phases].each do |phase_attr|
            phase = create_phase(pipe, phase_attr)

            phase_attr[:cards][:edges].each do |card_attr|
              create_card(phase, card_attr[:node])
            end
          end
        end

        organization
      end
    end
  end

  private

  def create_organization(attributes)
    organization = Organization.where(external_id: attributes[:id]).first_or_initialize

    organization.assign_attributes(name: attributes[:name])
    organization.save!

    organization
  end

  def create_pipe(organization, attributes)
    pipe = organization.pipes.where(external_id: attributes[:id]).first_or_initialize

    pipe.assign_attributes(
      name: attributes[:name],
      start_form_fields: attributes[:start_form_fields]
    )
    pipe.save!

    pipe
  end

  def create_phase(pipe, attributes)
    phase = pipe.phases.where(external_id: attributes[:id]).first_or_initialize

    phase.assign_attributes(
      name: attributes[:name],
      fields: attributes[:fields]
    )
    phase.save!

    phase
  end

  def create_card(phase, attributes)
    card = phase.cards.where(external_id: attributes[:id]).first_or_initialize

    card.assign_attributes(
      title: attributes[:title],
      fields: attributes[:fields],
      due_date: attributes[:due_date]
    )

    card.save!
  end
end
