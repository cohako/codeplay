require 'rails_helper'

describe 'Admin view instructors' do
  it 'successfully' do
    Instructor.create!(name: 'Rubyson', 
                      email: 'ruby@teste.com', 
                      bio: 'Sou uns instrutor que está aprendendo')
    
    visit root_path
    click_on 'Professores'

    expect(page).to have_content('Rubyson')
    expect(page).to have_content('ruby@teste.com')
    expect(page).to have_content('Sou uns instrutor que está aprendendo')
    expect(page).to have_link('Voltar', href: root_path)
  end

  it 'and no instructor is available' do
    visit root_path
    click_on 'Professores'

    expect(page).to have_content('Nenhum professor disponível')
  end

  it 'and view details' do
    visit root_path
    click_on 'Professores'
    click_on 'Cadastrar novo professor'

    fill_in 'Nome', with: 'Rubyson'
    fill_in 'Email', with: 'ruby@teste.com'
    fill_in 'Descrição', with: 'Sou uns instrutor que está aprendendo'
    attach_file 'Foto de perfil', Rails.root.join('spec/fixtures/test.jpg')
    click_on 'Enviar'

    expect(page).to have_content('Rubyson')
    expect(page).to have_content('ruby@teste.com')
    expect(page).to have_content('Sou uns instrutor que está aprendendo')
    expect(page).to have_link('Voltar', href: instructors_path)
  end
end