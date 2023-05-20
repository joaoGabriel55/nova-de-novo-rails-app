# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'customers/new.html.erb', type: :feature do
  let(:states) { %w[RN SP] }
  let(:cities) { ['Natal', 'Rio Branco'] }

  before do
    allow(StateCitiesService).to receive(:states).and_return(states)
    allow(StateCitiesService).to receive(:cities).and_return(cities)
  end

  it 'creating a new customer' do
    visit '/customers/new'

    within 'form' do
      fill_in 'customer_name', with: 'John Doe'
      fill_in 'customer_phone_number', with: '1234567890'
      fill_in 'customer_whatsapp', with: '0987654321'
      fill_in 'customer_email', with: 'john@example.com'

      select 'RN', from: 'states'
      select 'Rio Branco', from: 'cities'

      fill_in 'customer_address_attributes_zip_code', with: '12345'
      fill_in 'customer_address_attributes_street', with: 'Main Street'
      fill_in 'customer_address_attributes_neighborhood', with: 'Downtown'
      fill_in 'customer_address_attributes_number', with: '123'
      fill_in 'customer_address_attributes_complement', with: 'Apartment 4'

      click_button I18n.t('common.submit')
    end

    expect(page).to have_content(I18n.t('customers.success.create'))
    expect(Customer.last.name).to eq('John Doe')
  end
end
