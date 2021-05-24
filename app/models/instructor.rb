class Instructor < ApplicationRecord
  has_one_attached :profile_picture
  has_many :courses, dependent: :restrict_with_error

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  #TODO: fazer attach de imagem padrão usando after_create e chegando image.attached?
  #def attach_default_banner
  #return if image.attached?
end
