class Instructor < ApplicationRecord
  validates_presence_of :name, :email, message: 'Não pode ficar em branco'
  validates_uniqueness_of :email, message: 'já está em uso'
end
