require 'rails_helper'

describe 'Admin edit instructor' do
  it 'successufully' do
    Instructor.create!(name: 'Capybarason', 
                      email: 'capybara@test.com', 
                      bio: 'Eu soum um agente de teste')

    visit root_path
    click_on 'Professores'
    click_on 'Capybarason'
    click_on 'Editar'

    fill_in 'Nome', with: 'Javanaldo'
    fill_in 'Email', with: 'java@test.com'
    fill_in 'Descrição', with: 'Eu uso JOption'
    click_on 'Cadastrar Professor'

    expect(page).to have_content('Javanaldo')
    expect(page).to have_content('java@test.com')
    expect(page).to have_content('Eu uso JOption')
  end
end