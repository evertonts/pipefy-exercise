class Phase < ApplicationRecord
  has_many :cards, dependent: :destroy
  belongs_to :pipe
end
