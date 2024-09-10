class Tag < ApplicationRecord
  validates :nome, uniqueness: true

  has_many :tag_rooms, foreign_key: :tag
  has_many :rooms, through: :tag_rooms
end
