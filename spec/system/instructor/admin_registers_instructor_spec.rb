require 'rails_helper'

describe 'Admin registers instructor' do 

  it 'from index page' do
    user = User.create(email: 'teste@teste.com', password: '123456')

    login_as(user)
    visit root_path
    click_on 'Professores'

    expect(page).to have_link('Cadastrar novo professor',
                              href: new_instructor_path)
    expect(page).to have_link('Voltar', href: root_path)
  end

  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')

    login_as(user)
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'
    fill_in 'Nome', with: 'Railson'
    fill_in 'Email', with: 'railson@teste.com'
    fill_in 'Descrição', with: 'Sou uns instrutor que está aprendendo'
    attach_file 'Foto de perfil', Rails.root.join('spec/fixture/test.jpg')
    click_on 'Criar Professor'
    

    expect(page).to have_content('Railson')
    expect(page).to have_content('railson@teste.com')
    expect(page).to have_content('Sou uns instrutor que está aprendendo')
    expect(page).to have_css("img[src*='test.jpg']")
    expect(page).to have_link('Voltar', href: instructors_path)
    
  end

  it 'and attributes cannot be blank' do
    user = User.create(email: 'teste@teste.com', password: '123456')

    login_as(user)
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'
    fill_in 'Nome', with: ''
    fill_in 'Email', with: ''
    fill_in 'Descrição', with: ''
    click_on 'Criar Professor'

    expect(page).to have_content('Não pode ficar em branco', count: 2)
    expect(page).to have_link('Cancelar' ,href: instructors_path)
  end

  it 'and email must be uniq' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    Instructor.create!(name: 'Ruby', bio: 'Um curso de Ruby',
                      email: 'r@mail.com')
    login_as(user)
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'
    fill_in 'Email', with: 'r@mail.com'
    click_on 'Criar Professor'

    expect(page).to have_content('Já está em uso')
  end

end