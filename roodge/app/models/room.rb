class Room < ApplicationRecord
  validates :post_utenti, inclusion: { in: [0, 1] }
  has_many :tag_rooms, foreign_key: :room
  has_many :tags, through: :tag_rooms
end
