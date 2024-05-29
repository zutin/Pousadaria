require 'rails_helper'

describe 'Inn owner registers a group booking' do
  it 'can navigate to the new group booking page' do
    #Arrange
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})

    #Act
    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Nova reserva de grupo'

    #Assert
    expect(current_path).to eq new_inn_dashboard_inns_group_bookings_path
  end

  it 'can register a new group booking successfully' do
    #Arrange
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})

    #Act
    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'

    click_on 'Nova reserva de grupo'
    fill_in 'Nome da reserva', with: 'Confraternização da Campus Code'
    fill_in 'Data de chegada', with: '2024-06-01'
    fill_in 'Data de saída', with: '2024-06-03'
    click_on 'Criar Reserva de grupo'

    #Assert
    expect(page).to have_content('Você registrou a reserva de grupo com sucesso.')
    within('section#group-bookings') do
      expect(page).to have_content('Confraternização da Campus Code')
      expect(page).to have_content('01/06/2024')
      expect(page).to have_content('03/06/2024')
    end
  end
end