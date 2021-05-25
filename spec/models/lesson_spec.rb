require 'rails_helper'

describe Lesson do
  context 'Validation' do
    it 'Atribute cannot be blank' do
      lesson = Lesson.new

      lesson.valid?

      expect(lesson.errors[:name]).to include('Não pode ficar em branco')
    end
  end
end
