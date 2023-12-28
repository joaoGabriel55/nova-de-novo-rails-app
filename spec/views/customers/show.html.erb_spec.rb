# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'customers/show.html.erb', type: :feature do
  let(:states) { %w[RN SP] }
  let(:cities) { ['Natal', 'Rio Branco'] }
  let!(:created_customer) do
    FactoryBot.create(:customer, name: 'John Doe')
  end

  before do
    allow(StateCitiesService).to receive(:states).and_return(states)
    allow(StateCitiesService).to receive(:cities).and_return(cities)
  end

  it 'editing a customer' do
    visit "/customers/#{created_customer.id}"

    within 'form' do
      fill_in 'customer_name', with: 'John Doe Updated'
      fill_in 'customer_address_attributes_street', with: 'Main Street Updated'

      click_button I18n.t('common.submit')
    end

    expect(page).to have_content(I18n.t('customers.success.update'))
    expect(Customer.last.name).to eq('John Doe Updated')
    expect(Customer.last.address.street).to eq('Main Street Updated')
  end

  context 'when the customer update fails' do
    it 'shows error message' do
      allow(Customers::UpdateCustomer).to receive(:new).and_raise(CustomerErrors::UpdateError)

      visit "/customers/#{created_customer.id}"

      within 'form' do
        fill_in 'customer_name', with: 'John Doe Updated'
        fill_in 'customer_address_attributes_street', with: 'Main Street Updated'

        click_button I18n.t('common.submit')
      end

      expect(page).to have_content(I18n.t('customers.errors.update'))
    end
  end
end
