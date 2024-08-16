class Commenti < ApplicationRecord
  validates :codice, :room, :proprietario, :titolo presence: true
  validates :codice, uniqueness: { scope: [:room, :proprietario, :titolo] }
end
