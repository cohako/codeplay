require 'rails_helper'

describe Course do
  context 'validation' do

    it 'attributes cannot be blank' do
      course = Course.new

      course.valid?

      expect(course.errors[:name]).to include('Não pode ficar em branco')
      expect(course.errors[:code]).to include('Não pode ficar em branco')
      expect(course.errors[:price]).to include('Não pode ficar em branco')
    end

    it 'code must be uniq' do
      instructor = Instructor.create!(name: 'Rubyson', 
                                      email: 'ruby@teste.com', 
                                      bio: 'Sou uns instrutor que está aprendendo')
      Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                    code: 'RUBYBASIC', price: 10,
                    enrollment_deadline: '22/12/2033', instructor: instructor)
      course = Course.new(code: 'RUBYBASIC')

      course.valid?

      expect(course.errors[:code]).to include('Já está em uso')
    end
  end
end