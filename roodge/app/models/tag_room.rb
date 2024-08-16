class TagRoom < ApplicationRecord
  validates :room, uniqueness: true
end
