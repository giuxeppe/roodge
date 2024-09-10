class Room < ApplicationRecord
  validates :post_utenti, inclusion: { in: [0, 1] }
end
