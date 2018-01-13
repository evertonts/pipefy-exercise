class Organization < ApplicationRecord
  has_many :pipes, dependent: :destroy
  accepts_nested_attributes_for :pipes
end
