require 'rails_helper'

describe 'Admin edit instructor' do
  it 'successufully' do

    instructor = Instructor.create!(name: 'Capybarason', 
                                    email: 'capybara@test.com', 
                                    bio: 'Eu soum um agente de teste')

    instructor.profile_picture.attach(io: File.open('spec/fixture/test.jpg'), 
    filename: 'test.jpg')
    
    visit root_path
    click_on 'Professores'
    click_on 'Capybarason' 
    click_on 'Editar'

    fill_in 'Nome', with: 'Javanaldo'
    fill_in 'Email', with: 'java@test.com'
    fill_in 'Descrição', with: 'Eu uso JOption'
    attach_file 'Foto de perfil', Rails.root.join('spec/fixture/test.jpg')
    click_on 'Atualizar Professor'

    expect(page).to have_content('Atualizado com sucesso')
    expect(page).to have_content('Javanaldo')
    expect(page).to have_content('java@test.com')
    expect(page).to have_content('Eu uso JOption')
    expect(page).to have_css("img[src*='test.jpg']")
  end

  it 'successufully' do
    instructor = Instructor.create!(name: 'Capybarason', 
                                    email: 'capybara@test.com', 
                                    bio: 'Eu soum um agente de teste')

    instructor.profile_picture.attach(io: File.open('spec/fixture/test.jpg'), 
    filename: 'test.jpg')
    
    visit root_path
    click_on 'Professores'
    click_on 'Capybarason' 
    click_on 'Editar'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Descrição', with: ''
    attach_file 'Foto de perfil', Rails.root.join('spec/fixture/test.jpg')
    click_on 'Atualizar Professor'

    expect(page).to have_content('Não pode ficar em branco', count: 2)
    expect(page).to have_link('Cancelar' ,href: instructor_path(instructor))
  end
end