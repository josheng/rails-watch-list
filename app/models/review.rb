class Review < ApplicationRecord
  belongs_to :list
  validates :comment, length: { minimum: 6 }, presence: true
  validates :list_id, presence: true
  validates :rating, presence: true
end
