require 'rails_helper'

describe 'Admin edit course' do
  it 'successfully' do

    Course.create!(name: 'Rails na floresta', description: 'Um curso de rails',
                  code: 'RAILSFOREST', price: 10,
                  enrollment_deadline: '10/11/2050')

    visit root_path
    click_on 'Cursos'
    click_on 'Rails na floresta'
    click_on 'Editar'

    fill_in 'Nome', with: 'Rails na praia'
    fill_in 'Descrição', with: 'RAILSBEACH'
    fill_in 'Preço', with: '20'
    fill_in 'Data limite de matrícula', with: '09/10/2050'
    click_on 'Enviar'
    
    expect(page).to have_content('Atualizado com sucesso')
    expect(page).to have_content('Rails na praia')
    expect(page).to have_content('RAILSBEACH')
    expect(page).to have_content('R$ 20,00')
    expect(page).to have_content('09/10/2050')
  end
end