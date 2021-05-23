class Course < ApplicationRecord
# TODO: Validar data não pode ser menor que hoje
  belongs_to :instructor
  has_many :courses
  
  validates_presence_of :name, :code, 
                        :price

  validates_uniqueness_of :code

  
end
