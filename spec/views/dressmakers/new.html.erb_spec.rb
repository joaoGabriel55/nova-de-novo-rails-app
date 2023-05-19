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

    expect(page).to have_content(I18n.t('dressmakers.success_create'))
    expect(Dressmaker.last.name).to eq('Zuzu')
  end
end
