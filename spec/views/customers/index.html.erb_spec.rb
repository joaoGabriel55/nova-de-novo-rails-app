# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'customers/index.html.erb', type: :feature do
  it 'displays Clientes header' do
    visit '/customers'

    expect(page).to have_selector('h1', text: I18n.t('customers.index'))
  end

  context 'when there no customers' do
    it 'displays no customers message' do
      visit '/customers'

      expect(page).to have_selector('p', text: I18n.t('customers.empty'))
    end
  end

  context 'when there are customers' do
    let(:customers_names) { ['John Doe', 'Jose Doe', 'Maria Lion'] }
    let!(:customers) do
      customers_names.each do |name|
        FactoryBot.create(:customer, name:)
      end
    end

    it 'shows a customers table rows' do
      visit '/customers'

      customers_names.each do |name|
        expect(page).to have_selector('th', text: name)
      end
    end

    it 'shows total number of customers' do
      visit '/customers'

      expect(page).to have_selector('span', text: "#{I18n.t('customers.customers_number')}: 3")
    end
  end

  context 'when is searching for customers' do
    let(:customers_names) { ['John Doe', 'Jose Doe', 'Maria Lion'] }
    let!(:customers) do
      customers_names.each do |name|
        FactoryBot.create(:customer, name:)
      end
    end

    it 'shows matching customers' do
      visit '/customers'

      fill_in 'search', with: 'Doe'

      click_on I18n.t('common.search')

      expect(page).to have_selector('span', text: "#{I18n.t('customers.search_customers_number')}: 2")
      expect(page).to have_selector('th', text: 'John Doe')
      expect(page).to have_selector('th', text: 'Jose Doe')
      expect(page).to_not have_selector('th', text: 'Maria Lion')
    end

    it 'shows no matching customers' do
      visit '/customers'

      fill_in 'search', with: 'Zac'

      click_on I18n.t('common.search')

      expect(page).to have_selector('p', text: I18n.t('customers.empty_search'))
    end

    context 'when is clicked on show all' do
      it 'shows all customers' do
        visit '/customers'

        fill_in 'search', with: 'Zac'

        click_on I18n.t('common.search')

        expect(page).to have_selector('p', text: I18n.t('customers.empty_search'))

        click_on I18n.t('customers.show_all')

        customers_names.each do |name|
          expect(page).to have_selector('th', text: name)
        end
      end
    end
  end

  context 'when is clicked on delete customer button' do
    let!(:customer) { FactoryBot.create(:customer, name: 'John Doe') }

    it 'deletes the customer' do
      visit '/customers'

      expect(page).to have_selector('th', text: 'John Doe')

      click_on "delete-#{customer.id}"

      expect(page).to have_selector('div', text: I18n.t('customers.success_destroy'))
      expect(page).to_not have_selector('th', text: 'John Doe')
    end
  end
end
