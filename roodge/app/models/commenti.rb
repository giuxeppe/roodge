class Commenti < ApplicationRecord
  validates :room, :proprietario, :testo, presence: true
  validates :room, uniqueness: { scope: [:proprietario, :testo] }
end 
