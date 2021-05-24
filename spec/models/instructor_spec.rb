require 'rails_helper'

describe Course do
  context 'Validation' do
    it 'attribute cannot be blank' do
      instructor = Instructor.new

      instructor.valid?

      expect(instructor.errors[:name]).to include('Não pode ficar em branco')
      expect(instructor.errors[:email]).to include('Não pode ficar em branco')
    end

    it 'email must be uniq' do
      Instructor.create!(name: 'Pythona', 
                        email: 'python@test.com', 
                        bio: 'Eu troco de pele')

      instructor = Instructor.new(email: 'python@test.com')

      instructor.valid?

      expect(instructor.errors[:email]).to include('Já está em uso')
    end
  end
end
