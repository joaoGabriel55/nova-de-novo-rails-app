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
end
