require 'rails_helper'

describe 'Admin register lessons' do
  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                code: 'RUBYBASIC', price: 10,
                                enrollment_deadline: '22/12/2033', 
                                instructor: instructor)
    
    login_as(user)
    visit course_path(course)
    click_on 'Cadastrar nova aula'

    fill_in 'Nome', with: 'Introdução'
    fill_in 'Descrição', with: 'é uma introdução'
    click_on 'Criar Aula'
    
    expect(page).to have_content('Criado com sucesso')
    expect(page).to have_content('Introdução')
    expect(page).to have_content('é uma introdução')

  end

  it 'cannot be blank' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', 
                            instructor: instructor)
    
    login_as(user)
    visit course_path(course)
    click_on 'Cadastrar nova aula'

    click_on 'Criar Aula'

    expect(page).to have_content('Não pode ficar em branco')

  end
end