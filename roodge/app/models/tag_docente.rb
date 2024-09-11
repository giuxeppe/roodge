class TagDocente < ApplicationRecord
  validates :docente, presence: true
  validates :tag, presence: true
end
 