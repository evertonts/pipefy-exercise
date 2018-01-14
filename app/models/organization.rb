class Organization < ApplicationRecord
  has_many :pipes, dependent: :destroy
end
