require 'rails_helper'

describe 'Visitor manage account' do
  context 'Sign Up' do
    it 'with email and password' do

      visit root_path
      click_on 'Cadastrar'
      fill_in :user_email, with: 'visitante@visita.com'
      fill_in :user_password, with: '123456'
      fill_in :user_password_confirmation, with: '123456'
      within 'div#cadastrar' do
        click_on 'Cadastrar'
      end


      expect(page).to have_content('visitante@visita.com')
      expect(page).to have_content('Bem vindo! Você realizou seu registro com sucesso.')
      expect(page).to_not have_content('Entrar')

    end

    it 'email and password must be filled' do
    
      visit root_path
      click_on 'Cadastrar'
      within 'div#cadastrar' do
        click_on 'Cadastrar'
      end

      expect(page).to have_content('E-mail Não pode ficar em branco')
      expect(page).to have_content('Senha Não pode ficar em branco')

    end

    it 'email must be uniq' do

      user = User.create!(email: 'visitante@visita.com', password: '123456')
      
      visit root_path
      click_on 'Cadastrar'
      fill_in :user_email, with: user.email
      fill_in :user_password, with: '123456'
      fill_in :user_password_confirmation, with: '123456'
      within 'div#cadastrar' do
        click_on 'Cadastrar'
      end

      expect(page).to have_content('E-mail Já está em uso')

    end

    it 'password and confirmation must match' do
      visit root_path
      click_on 'Cadastrar'
      fill_in :user_email, with: 'visitante@visita.com'
      fill_in :user_password, with: '123456'
      fill_in :user_password_confirmation, with: '654321'
      within 'div#cadastrar' do
        click_on 'Cadastrar'
      end

      expect(page).to have_content('Confirme sua senha não é igual a Senha')

    end

    it 'email must be valid' do

      visit root_path
      click_on 'Cadastrar'
      fill_in :user_email, with: 'visitante2'
      fill_in :user_password, with: '123456'
      fill_in :user_password_confirmation, with: '123456'
      within 'div#cadastrar' do
        click_on 'Cadastrar'
      end

      expect(page).to have_content('E-mail não é válido')

    end
  end

  context 'Sign In' do
    it 'with email and password' do

      User.create!(email: 'visitante@visita.com', password: '123456')

      visit root_path
      click_on 'Entrar'
      fill_in :user_email, with: 'visitante@visita.com'
      fill_in :user_password, with: '123456'
      within 'div#entrar' do
      click_on 'Entrar'
      end

      expect(page).to have_content('Login efetuado com sucesso')
      expect(current_path).to eq(root_path)

    end

    it 'email not found' do

      visit root_path
      click_on 'Entrar'
      fill_in :user_email, with: 'visitante@visita.com'
      fill_in :user_password, with: '123456'
      within 'div#entrar' do
      click_on 'Entrar'
      end

      expect(page).to have_content('E-mail ou senha inválidos.')
    end
  end

  context 'Sign Out' do
    it 'successfully' do
      user = User.create!(email: 'visitante@visita.com', password: '123456')

      login_as(user)
      visit root_path
      click_on 'SignOut'

      expect(page).to have_content('Logout efetuado com sucesso.')
    end
  end
end