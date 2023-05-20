# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'dressmakers/new.html.erb', type: :feature do
  it 'creating a new customer' do
    visit '/dressmakers/new'

    within 'form' do
      fill_in 'dressmaker_name', with: 'Zuzu'
      fill_in 'dressmaker_max_service_quantity', with: 20
      fill_in 'dressmaker_start_working_date', with: '20/05/2022'

      click_button I18n.t('common.submit')
    end

    expect(page).to have_content(I18n.t('dressmakers.success.create'))
    expect(Dressmaker.last.name).to eq('Zuzu')
  end

  context 'when the dressmaker max service quantity is less than 0' do
    it 'shows error message' do
      visit '/dressmakers/new'

      within 'form' do
        fill_in 'dressmaker_name', with: 'Zuzu'
        fill_in 'dressmaker_max_service_quantity', with: -1
        fill_in 'dressmaker_start_working_date', with: '20/05/2022'

        click_button I18n.t('common.submit')

        expect(page).to have_content(
          I18n.t('activerecord.errors.models.dressmaker.attributes.max_service_quantity.greater_than')
        )
      end
    end
  end

  context 'when the dressmaker start working date is after today' do
    it 'shows error message' do
      visit '/dressmakers/new'

      within 'form' do
        fill_in 'dressmaker_name', with: 'Zuzu'
        fill_in 'dressmaker_max_service_quantity', with: 1
        fill_in 'dressmaker_start_working_date', with: "20/05/#{Date.today.year + 1}"

        click_button I18n.t('common.submit')

        expect(page).to have_content(
          I18n.t('activerecord.errors.models.dressmaker.attributes.start_working_date.less_than_or_equal_to')
        )
      end
    end
  end
end
