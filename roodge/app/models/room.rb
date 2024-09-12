
class Room < ApplicationRecord
    validates :post_utenti, inclusion: { in: [0, 1] }
    def as_json(options = {})
      super(only: [:id, :nome])
  end
  end
  