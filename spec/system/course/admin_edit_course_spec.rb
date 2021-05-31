require 'rails_helper'

describe 'Admin edit course' do
  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    Course.create!(name: 'Rails na floresta', description: 'Um curso de rails',
                  code: 'RAILSFOREST', price: 10,
                  enrollment_deadline: '10/11/2050', instructor: instructor)

    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Rails na floresta'
    click_on 'Editar'

    fill_in 'Nome', with: 'Rails na praia'
    select 'Rubyson', from: 'Professor'
    fill_in 'Descrição', with: 'Um curso de rails na praia'
    fill_in 'Código', with: 'RAILSBEACH'
    fill_in 'Preço', with: '20'
    fill_in 'Data limite de matrícula', with: '09/10/2050'
    click_on 'Enviar'
    
    expect(page).to have_content('Atualizado com sucesso')
    expect(page).to have_content('Rails na praia')
    expect(page).to have_content('RAILSBEACH')
    expect(page).to have_content('R$ 20,00')
    expect(page).to have_content('09/10/2050')
  end

  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Rails na floresta', description: 'Um curso de rails',
                            code: 'RAILSFOREST', price: 10,
                            enrollment_deadline: '10/11/2050', instructor: instructor)
    
    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Rails na floresta'
    click_on 'Editar'

    fill_in 'Nome', with: ''
    select 'Rubyson', from: 'Professor'
    fill_in 'Código', with: ''
    fill_in 'Descrição', with: ''
    fill_in 'Preço', with: ''
    fill_in 'Data limite de matrícula', with: ''
    click_on 'Enviar'
    
    expect(page).to have_content('Não pode ficar em branco', count: 4)
    expect(page).to have_link('Cancelar' ,href: course_path(course))
  end
end