require 'rails_helper'

describe 'Admin erase instructor' do
  it 'successfully' do
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'
    
    fill_in 'Nome', with: 'Capybarason'
    fill_in 'Email', with: 'capybara@test.com'
    fill_in 'Descrição', with: 'Eu soum um agente de teste'
    attach_file 'Foto de perfil', Rails.root.join('tmp/storage/test.jpg')
    click_on 'Enviar'
    

  visit root_path
  click_on 'Professores'
  click_on 'Capybarason'
  click_on 'Apagar'

  expect(page).to_not have_content('Capybarason')
  end
end