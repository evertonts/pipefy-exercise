class Phase < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :pipe

  accepts_nested_attributes_for :cards
end
