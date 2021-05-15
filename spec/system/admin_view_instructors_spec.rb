require 'rails_helper'

describe 'Admin view instructors' do
  it 'successfully' do
    Instructor.create!(name: 'Rubyson', 
                      email: 'rubyson@teste.com', 
                      bio: 'Sou uns instrutor que está aprendendo')
    
    visit root_path
    click_on 'Professores'

    expect(page).to have_content('Rubyson')
    expect(page).to have_content('rubyson@teste.com')
    expect(page).to have_content('Sou uns instrutor que está aprendendo')
  end


end