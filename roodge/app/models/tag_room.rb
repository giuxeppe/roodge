class TagRoom < ApplicationRecord
  belongs_to :room, primary_key: :id, foreign_key: :room
  belongs_to :tag, primary_key: :id, foreign_key: :tag
end
