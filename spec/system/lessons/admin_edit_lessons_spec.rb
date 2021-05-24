require 'rails_helper'

describe 'Admin edit lesson' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', 
                            instructor: instructor)
    Lesson.create!(name: 'Introdução', 
                  content: 'É uma introdução', 
                  course: course)

    visit courses_path
    click_on 'Ruby'
    click_on 'Editar Aula'

    fill_in 'Nome',with:'Começando'
    fill_in 'Descrição', with: 'É um começo'
    click_on 'Atualizar Aula'

    expect(page).to have_content('Começando')
    expect(page).to have_content('É um começo')
  end

  it 'cannot be blank' do
    instructor = Instructor.create!(name: 'Rubyson', 
      email: 'ruby@teste.com', 
      bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
    code: 'RUBYBASIC', price: 10,
    enrollment_deadline: '22/12/2033', 
    instructor: instructor)
    lesson = Lesson.create!(name: 'Introdução', 
    content: 'É uma introdução', 
    course: course)

    visit courses_path
    click_on 'Ruby'
    click_on 'Editar Aula'
    fill_in 'Nome', with: ''
    click_on 'Atualizar Aula'

    expect(page).to have_content('Não pode ficar em branco')

  end
end