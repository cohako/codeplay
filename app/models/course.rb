class Course < ApplicationRecord
# TODO: Validar data não pode ser menor que hoje
  belongs_to :instructor
  has_many :lessons, dependent: :restrict_with_error
  
  validates :name, :code, :price, :enrollment_deadline,presence: true

  validates :code, uniqueness: true

  
end
