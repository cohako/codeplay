require 'rails_helper'

describe 'User enroll on course' do
  it 'and buy course' do
    user = User.create(email: 'teste@teste.com', password: '123456')
    instructor = Instructor.create!(name: 'Rubyson', 
                                  email: 'ruby@teste.com', 
                                  bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                   code: 'RUBYBASIC', price: 10,
                   enrollment_deadline: '22/12/2033', instructor: instructor)
    login_as(user)
    visit course_path(course)
    click_on 'Comprar'

    expect(page).to have_content('Curso comprado com sucesso')
    expect(page).to have_content('Ruby')
    expect(page).to have_content('RUBYBASIC')
    expect(page).to have_content('Rubyson')
  end
end