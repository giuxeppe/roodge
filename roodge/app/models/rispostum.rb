class Rispostum < ApplicationRecord
  validates :codice, :commento, :room, :proprietario, :titolo, presence: true
  validates :codice, uniqueness: { scope: [:commento, :room, :proprietario, :titolo] }
end
