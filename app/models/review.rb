class Review < ApplicationRecord
  belongs_to :list

  validates :rating, presence: true, inclusion: (0..5)
  validates :content, presence: true, length: { minimum: 5 }
end
