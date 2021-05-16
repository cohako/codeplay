require 'rails_helper'

describe 'Admin erase instructor' do
  it 'successfully' do

  Instructor.create!(name: 'Capybarason', 
    email: 'capybara@test.com', 
    bio: 'Eu soum um agente de teste')

  visit root_path
  click_on 'Professores'
  click_on 'Capybarason'
  click_on 'Apagar'

  expect(page).to_not have_content('Capybarason')
  end
end