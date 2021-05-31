require 'rails_helper'

describe 'Admin view lessons' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Rubyson', 
      email: 'ruby@teste.com', 
      bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', 
                            instructor: instructor)
    Lesson.create!(name: 'Introdução', 
                            content: 'É uma introdução', 
                            course: course)
    
    visit root_path
    click_on 'Cursos'
    click_on 'Ruby'

    expect(page).to have_content('Introdução')
    expect(page).to have_content('É uma introdução')
  end

  it 'no lessons registred' do
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', 
                            instructor: instructor)
    
    visit course_path(course)
    
    expect(page).to have_content('Nenhuma aula cadastrada')
  end
end