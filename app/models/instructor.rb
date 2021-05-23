class Instructor < ApplicationRecord
  has_one_attached :profile_picture
  has_many :courses

  validates_presence_of :name, :email, message: 'Não pode ficar em branco'
  validates_uniqueness_of :email, message: 'já está em uso'
  #TODO: fazer attach de imagem padrão usando after_create e chegando image.attached?
  #def attach_default_banner
  #return if image.attached?
end
