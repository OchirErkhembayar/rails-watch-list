class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates_uniqueness_of :movie, :list, scope: %i[movie_id list_id]
end
