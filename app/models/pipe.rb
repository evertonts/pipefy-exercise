class Pipe < ApplicationRecord
  belongs_to :organization
  has_many :phases, dependent: :destroy

  accepts_nested_attributes_for :phases
end
