require 'rails_helper'

describe 'Admin erase course' do
  before(:each) do
    Instructor.create!(name: 'Rubyson', 
                      email: 'ruby@teste.com', 
                      bio: 'Sou uns instrutor que está aprendendo')
  end
  it 'successfully' do
    Course.create!(name: 'Rails na floresta', description: 'Um curso de rails',
                  code: 'RAILSFOREST', price: 10,
                  enrollment_deadline: '10/11/2050', instructor_id: 1)

    visit root_path
    click_on 'Cursos'
    click_on 'Rails na floresta'
    click_on 'Apagar'

    expect(page).to_not have_content('Rails na floresta')
  end
end