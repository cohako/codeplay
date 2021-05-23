require 'rails_helper'

describe 'Admin view lessons' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                                code: 'RUBYBASIC', price: 10,
                                enrollment_deadline: '22/12/2033', 
                                instructor: instructor)
    
    visit root_path
    click_on 'Cursos'
    click_on 'Ruby'
    click_on 'Cadastrar nova aula'

    fill_in 'Nome', with: 'Introdução'
    fill_in 'Tempo de aula', with: '10'
    click_on 'Criar Aula'

    expect(page).to have_content('Introcução')
    expect(page).to have_content('10 minutos')

  end
end