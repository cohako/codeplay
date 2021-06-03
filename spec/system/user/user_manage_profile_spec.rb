require 'rails_helper'

describe 'User manage profile' do
  it 'and fill in information' do
    user = User.create(email: 'testildo@testa.com', password: '123dasilva4')

    login_as(user)
    visit root_path
    click_on user.email
    click_on 'Adicionar dados'
    fill_in 'Nome', with: 'Testildo da tilva'
    fill_in 'Endereço', with: 'Quebrada, 420, osasco'
    click_on 'Enviar'

    expect(page).to have_content('testildo@testa.com')
    expect(page).to have_content('Testildo da tilva')
    expect(page).to have_content('Quebrada, 420, osasco')
  end

  it 'adn edit information' do
    user = User.create(email: 'testildo@testa.com', password: '123dasilva4')
    profile = Profile.create(name: 'Testildo da Silva', adress: 'Quebrada, 420, osasco', user_id: user.id)

    login_as(user)
    visit root_path
    click_on user.email
    click_on 'Editar dados'
    fill_in 'Nome', with: 'Testildo da tilva'
    fill_in 'Endereço', with: 'Quebrada, 420, osasco'
    click_on 'Enviar'

    expect(page).to have_content('testildo@testa.com')
    expect(page).to have_content('Testildo da tilva')
    expect(page).to have_content('Quebrada, 420, osasco')
  end

  it 'And do not have information' do
    user = User.create(email: 'testildo@testa.com', password: '123dasilva4')

    login_as(user)
    visit root_path
    click_on user.email

    expect(page).to have_content('Cadastre suas informações')
    expect(page).to have_content('Adicionar dados')
  end
end