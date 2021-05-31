class Enroll < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :user, :course, :price, presence: true
end
