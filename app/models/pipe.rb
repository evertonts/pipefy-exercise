class Pipe < ApplicationRecord
  belongs_to :organization
  has_many :phases, dependent: :destroy

  # Public: Returns all fields for all phases of the pipe
  #
  # Returns an Array
  def fields
    phases_fields = phases.inject([]) do |buffer, phase|
      buffer + phase.fields
    end

    (phases_fields + start_form_fields).uniq { |field| field['id'] }
  end

  # Public: Returns all cards in the pipe
  #
  # Returns an Array
  def cards
    Card.where(phase: phases)
  end
end
