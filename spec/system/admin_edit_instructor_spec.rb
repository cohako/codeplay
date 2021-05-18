require 'rails_helper'

describe 'Admin edit instructor' do
  it 'successufully' do

    instructor = Instructor.create!(name: 'Capybarason', 
                                    email: 'capybara@test.com', 
                                    bio: 'Eu soum um agente de teste')

    instructor.profile_picture.attach(io: File.open('spec/fixtures/test.jpg'), 
    filename: 'test.jpg')
    
    visit root_path
    click_on 'Professores'
    click_on 'Capybarason' 
    click_on 'Editar'

    fill_in 'Nome', with: 'Javanaldo'
    fill_in 'Email', with: 'java@test.com'
    fill_in 'Descrição', with: 'Eu uso JOption'
    attach_file 'Foto de perfil', Rails.root.join('spec/fixtures/test.jpg')
    click_on 'Enviar'

    expect(page).to have_content('Atualizado com sucesso')
    expect(page).to have_content('Javanaldo')
    expect(page).to have_content('java@test.com')
    expect(page).to have_content('Eu uso JOption')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end