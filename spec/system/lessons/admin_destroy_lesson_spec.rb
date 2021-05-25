require 'rails_helper'

describe 'Admin destroy lesson' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Rubyson', 
                                    email: 'ruby@teste.com', 
                                    bio: 'Sou uns instrutor que está aprendendo')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', 
                            instructor: instructor)
    lesson = Lesson.create!(name: 'Introdução', 
                            content: 'É uma introdução', 
                            course: course)
    
    visit course_path(course)
    click_on 'Apagar Introdução'
    
    expect(page).to have_content('Apagado com sucesso')
    expect(page).to_not have_content('Introdução')
  end

end