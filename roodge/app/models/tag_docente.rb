class TagDocente < ApplicationRecord
  validates :docente, uniqueness: true
end
