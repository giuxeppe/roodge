class StudenteRoom < ApplicationRecord
  validates :studente, :room, presence: true
  validates :studente, uniqueness: { scope: [:room] }
  validates :approvazioni, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
