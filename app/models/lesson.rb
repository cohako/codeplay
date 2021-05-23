class Lesson < ApplicationRecord
  belongs_to :course

  validates :name, :content, presence: true
end
