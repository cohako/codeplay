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
    instructor = Instructor.create!(name: 'Rubyson', 
                      email: 'ruby@teste.com', 
                      bio: 'Sou uns instrutor que está aprendendo')

    visit instructor_path(instructor)
    
    expect(page).to have_content('Rubyson')
    expect(page).to have_content('ruby@teste.com')
    expect(page).to have_content('Sou uns instrutor que está aprendendo')
    expect(page).to have_link('Voltar', href: instructors_path)
  end
end