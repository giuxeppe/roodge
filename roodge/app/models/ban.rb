class Ban < ApplicationRecord
  validates :utente, :room, presence: true
  validates :utente, uniqueness: { scope: [:room] }
end
