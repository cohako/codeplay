require 'rails_helper'

describe 'User edits profile' do
  it 'successfully' do
    user = User.create(email: 'testildo@testa.com', password: '123dasilva4')

    login_as(user)
    visit root_path
    click_on user.email
    click_on 'Editar'
    fill_in :name, with: 'Testildo da tilva'
    fill_in :address, with: 'Quebrada, 420, osasco'
    click_on 'Enviar'

    expect(page).to have_content('testildo@testa.com')
    expect(page).to have_content('Testildo da tilva')
    expect(page).to have_content('Quebrada, 420, osasco')
  end
end