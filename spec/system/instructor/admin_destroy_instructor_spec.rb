require 'rails_helper'

describe 'Admin erase instructor' do
  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Capybarason', 
                                    email: 'capybara@test.com', 
                                    bio: 'Eu soum um agente de teste')
                                    
    instructor.profile_picture.attach(io: File.open('spec/fixture/test.jpg'), 
                                      filename: 'test.jpg')
    login_as(user)
    visit root_path
    click_on 'Professores'
    click_on 'Capybarason'
    click_on 'Apagar'
    
    expect(page).to have_content('Apagado com sucesso')
    expect(page).to_not have_content(instructor.name)
  end

  it 'cant erase instructor with course' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Capybarason', 
      email: 'capybara@test.com', 
      bio: 'Eu soum um agente de teste')

    instructor.profile_picture.attach(io: File.open('spec/fixture/test.jpg'), 
        filename: 'test.jpg')

    Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                  code: 'RUBYBASIC', price: 10,
                  enrollment_deadline: '22/12/2033', instructor: instructor)
    login_as(user)
    visit instructors_path

    click_on 'Capybarason'
    click_on 'Apagar'

    expect(page).to have_content('Não é possível excluir o registro pois existem cursos dependentes')

  end
end