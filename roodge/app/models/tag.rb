class Tag < ApplicationRecord
  validates :nome, uniqueness: true
end
