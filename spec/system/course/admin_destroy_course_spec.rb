require 'rails_helper'

describe 'Admin erase course' do
  it 'successfully' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    Course.create!(name: 'Rails na floresta', description: 'Um curso de rails',
                  code: 'RAILSFOREST', price: 10,
                  enrollment_deadline: '10/11/2050', instructor: instructor)

    login_as(user)
    visit root_path
    click_on 'Cursos'
    click_on 'Rails na floresta'
    click_on 'Apagar'

    expect(page).to_not have_content('Rails na floresta')
  end
end