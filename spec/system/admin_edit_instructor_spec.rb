require 'rails_helper'

describe 'Admin edit instructor' do
  it 'successufully' do
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'

    fill_in 'Nome', with: 'Railson'
    fill_in 'Email', with: 'railson@teste.com'
    fill_in 'Descrição', with: 'Sou uns instrutor que está aprendendo'
    attach_file 'Foto de perfil', Rails.root.join('tmp/storage/test.jpg')
    click_on 'Enviar'
  
    click_on 'Editar'

    fill_in 'Nome', with: 'Javanaldo'
    fill_in 'Email', with: 'java@test.com'
    fill_in 'Descrição', with: 'Eu uso JOption'
    attach_file 'Foto de perfil', Rails.root.join('tmp/storage/test.jpg')
    click_on 'Enviar'

    expect(page).to have_content('Javanaldo')
    expect(page).to have_content('java@test.com')
    expect(page).to have_content('Eu uso JOption')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end