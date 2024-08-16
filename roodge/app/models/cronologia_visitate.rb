class CronologiaVisitate < ApplicationRecord
  validates :utente, :numero_ord, presence: true
  validates :utente, uniqueness: { scope: [:numero_ord] }
  validates :numero_ord, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, inclusion: { in: [0, 1, 2] }
end
