class Room < ApplicationRecord
  validates :codice, uniqueness: true
  validates :post_utenti, inclusion: { in: [0, 1] }
end
