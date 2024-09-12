class Commenti < ApplicationRecord
  validates :codice, :room, :proprietario, :titolo, presence: true
  validates :room, uniqueness: { scope: [:proprietario, :testo] }
end
