class Pipe < ApplicationRecord
  belongs_to :organization
  has_many :phases, dependent: :destroy

  accepts_nested_attributes_for :phases

  # Public: Returns all fields for all phases of the pipe
  #
  # Returns an Array
  def all_fields
    phases_fields = phases.inject([]) do |buffer, phase|
      buffer + phase.fields
    end

    (phases_fields + start_form_fields).uniq { |field| field['id'] }
  end

  # Public: Returns all cards in the pipe
  #
  # Returns an Array
  def all_cards
    Card.where(phase: phases)
  end
end
