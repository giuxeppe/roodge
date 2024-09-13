
class Room < ApplicationRecord
    before_save :generate_codice

    validates :post_utenti, inclusion: { in: [0, 1] }
    def as_json(options = {})
      super(only: [:id, :nome])
    end

    private

  def generate_codice
    self.codice ||= SecureRandom.hex(10) # Genera un codice univoco di 10 caratteri
  end
end