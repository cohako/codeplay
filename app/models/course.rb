class Course < ApplicationRecord
# TODO: Validar data não pode ser menor que hoje
  belongs_to :instructor
  has_many :lessons
  
  validates :name, :code, :price, presence: true

  validates :code, uniqueness: true

  
end
