class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy
  has_one_attached :photoc
  has_one_attached :photob

  validates :name, presence: true, uniqueness: true
end
