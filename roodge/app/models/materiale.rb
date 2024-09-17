class Materiale < ApplicationRecord
  validates :titolo, :proprietario, :room, presence: true
  validates :titolo, uniqueness: { scope: [:proprietario, :room] }

  has_one_attached :allegato
  
  validates :approvato, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, inclusion: { in: [0, 1] }
  validates :prezzo, numericality: { greater_than_or_equal_to: 0 }
end
