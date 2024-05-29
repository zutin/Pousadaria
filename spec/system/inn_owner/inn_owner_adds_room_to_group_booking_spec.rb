require 'rails_helper'

describe 'Inn owner adds room and guests count to a group booking' do
  it 'can navigate to the group booking page successfully' do
    #Arrange
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    booking = inn.group_bookings.create!(name: 'Confraternização da Campus Code', checkin_date: '2024-06-10', checkout_date: '2024-06-11')

    #Act
    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Confraternização da Campus Code'

    #Assert
    expect(current_path).to eq inn_dashboard_inns_group_booking_path(booking)
  end

  it 'can see the add group booking room page successfully' do
    #Arrange
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    booking = inn.group_bookings.create!(name: 'Confraternização da Campus Code', checkin_date: '2024-06-10', checkout_date: '2024-06-11')

    #Act
    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Confraternização da Campus Code'
    click_on 'Adicionar novo quarto'

    #Assert
    expect(current_path).to eq new_inn_dashboard_inns_group_booking_group_booking_room_path(booking)
  end

  it 'can add a group booking room successfully' do
    #Arrange
    inn_owner = InnOwner.create!(first_name: 'Joao', last_name: 'Almeida',  document: '53783222001', email: 'joao@email.com', password: '123456')
    inn = inn_owner.create_inn!(name: 'Pousada do Almeidinha', registration_number: '30638898000199', description: 'Um bom lugar', 
                                address_attributes: { address: 'Rua X', number: '100', city: 'Manaus', state: 'AM', postal_code: '69067-080', neighborhood: 'Centro'})
    booking = inn.group_bookings.create!(name: 'Confraternização da Campus Code', checkin_date: '2024-06-10', checkout_date: '2024-06-11')

    #Act
    login_as inn_owner, scope: :inn_owner
    visit root_path
    click_on 'Gestão de Pousadas'
    click_on 'Confraternização da Campus Code'
    click_on 'Adicionar novo quarto'

    #Assert
    expect(current_path).to eq new_inn_dashboard_inns_group_booking_group_booking_room_path(booking)
  end
end