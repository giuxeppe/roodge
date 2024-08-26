class User < ApplicationRecord
  validates :ruolo, inclusion: { in: ['s', 'd'] }
  validates :nome_utente, uniqueness: true
end