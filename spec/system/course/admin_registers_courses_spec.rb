require 'rails_helper'

describe 'Admin registers courses' do
  it 'from index page' do
    user = User.create(email: 'teste@teste.com', password: '123456')

    login_as(user)
    visit root_path
    click_on 'Cursos'

    expect(page).to have_link('Registrar um Curso',
                              href: new_course_path)
    expect(page).to have_link('Voltar',
                              href: root_path)
  end

  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    
    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Registrar um Curso'

    fill_in 'Nome', with: 'Ruby on Rails'
    select instructor.name, from: 'Professor'
    fill_in 'Descrição', with: 'Um curso de Ruby on Rails'
    fill_in 'Código', with: 'RUBYONRAILS'
    fill_in 'Preço', with: '30'
    fill_in 'Data limite de matrícula', with: '22/12/2033'
    click_on 'Enviar'

    expect(current_path).to eq(course_path(Course.last))
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Um curso de Ruby on Rails')
    expect(page).to have_content('RUBYONRAILS')
    expect(page).to have_content('Rubyson')
    expect(page).to have_content('R$ 30,00')
    expect(page).to have_content('22/12/2033')
    expect(page).to have_link('Voltar')
  end
  it 'and attributes cannot be blank' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                   code: 'RUBYBASIC', price: 10,
                   enrollment_deadline: '22/12/2033', instructor: instructor)
    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Registrar um Curso'
    fill_in 'Nome', with: ''
    fill_in 'Descrição', with: ''
    select 'Rubyson', from: 'Professor'
    fill_in 'Código', with: ''
    fill_in 'Preço', with: ''
    fill_in 'Data limite de matrícula', with: ''
    click_on 'Enviar'

    expect(page).to have_content('Não pode ficar em branco', count: 4)
    expect(page).to have_link( 'Cancelar', href: courses_path )
  end

  it 'and code must be unique' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                  email: 'ruby@teste.com', 
                                  bio: 'Sou uns instrutor que está aprendendo')
    Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                   code: 'RUBYBASIC', price: 10,
                   enrollment_deadline: '22/12/2033', instructor: instructor)
    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Registrar um Curso'
    fill_in 'Código', with: 'RUBYBASIC'
    click_on 'Enviar'

    expect(page).to have_content('Já está em uso')
  end

  it 'can be a draft' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                  email: 'ruby@teste.com', 
                                  bio: 'Sou uns instrutor que está aprendendo')

    login_as user
    visit courses_path
    click_on 'Registrar um Curso'
    fill_in 'Nome', with: 'Ruby on Rails'
    select instructor.name, from: 'Professor'
    page.check 'Rascunho'
    fill_in 'Descrição', with: 'Um curso de Ruby on Rails'
    fill_in 'Código', with: 'RUBYONRAILS'
    fill_in 'Preço', with: '30'
    fill_in 'Data limite de matrícula', with: '22/12/2033'
    click_on 'Enviar'

    expect(page).to have_content('Rascunho')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Um curso de Ruby on Rails')
    expect(page).to have_content('RUBYONRAILS')
    expect(page).to have_content('Rubyson')
    expect(page).to have_content('R$ 30,00')
    expect(page).to have_content('22/12/2033')
  end

  it '' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                  email: 'ruby@teste.com', 
                                  bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                    code: 'RUBYBASIC', price: 10,
                                    enrollment_deadline: '22/12/2033', instructor: instructor)

    login_as user
    visit course_path(course)
    click_on 'Editar'
    click_on 'Enviar'

    expect(page).to_not have_content('Rascunho')
    expect(page).to have_content('Ruby')
    expect(page).to have_content('Um curso de Ruby')
    expect(page).to have_content('RUBYBASIC')
    expect(page).to have_content('Rubyson')
    expect(page).to have_content('R$ 10,00')
    expect(page).to have_content('22/12/2033')
  end
end

