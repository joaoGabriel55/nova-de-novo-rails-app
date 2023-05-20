# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'dressmakers/show.html.erb', type: :feature do
  let!(:created_dressmaker) do
    FactoryBot.create(:dressmaker, name: 'John Doe')
  end

  let(:end_working_date) { "20/06/#{Date.today.year + 1}" }

  it 'editing a dressmaker' do
    visit "/dressmakers/#{created_dressmaker.id}"

    within 'form' do
      fill_in 'dressmaker_name', with: 'Zuzu Updated'
      fill_in 'dressmaker_max_service_quantity', with: 12
      fill_in 'dressmaker_end_working_date', with: end_working_date

      click_button I18n.t('common.submit')
    end

    expect(page).to have_content(I18n.t('dressmakers.success_update'))
    expect(Dressmaker.last.name).to eq('Zuzu Updated')
    expect(Dressmaker.last.max_service_quantity).to eq(12)
    expect(Dressmaker.last.end_working_date.strftime('%d/%m/%Y')).to eq(end_working_date)
  end

  context 'when the dressmaker end working date is before start working date' do
    let(:end_working_date) { "20/06/#{Date.today.year - 1}" }

    it 'shows error message' do
      visit "/dressmakers/#{created_dressmaker.id}"

      within 'form' do
        fill_in 'dressmaker_name', with: 'Zuzu Updated'
        fill_in 'dressmaker_max_service_quantity', with: 12
        fill_in 'dressmaker_end_working_date', with: end_working_date

        click_button I18n.t('common.submit')

        expect(page).to have_content(
          I18n.t('activerecord.errors.models.dressmaker.attributes.end_working_date.greater_than')
        )
      end
    end
  end
end
