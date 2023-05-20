# frozen_string_literal: true

require 'rails_helper'

def fill_form(end_working_date)
  within 'form' do
    fill_in 'dressmaker_name', with: 'Zuzu Updated'
    fill_in 'dressmaker_max_service_quantity', with: 12
    fill_in 'dressmaker_end_working_date', with: end_working_date

    click_button I18n.t('common.submit')
  end
end

RSpec.feature 'dressmakers/show.html.erb', type: :feature do
  let!(:created_dressmaker) do
    FactoryBot.create(:dressmaker, name: 'John Doe', start_working_date: Time.zone.today)
  end

  let(:end_working_date) { "20/06/#{Time.zone.today.year + 1}" }

  it 'editing a dressmaker' do
    visit "/dressmakers/#{created_dressmaker.id}"

    fill_form(end_working_date)

    expect(page).to have_content(I18n.t('dressmakers.success.update'))
    expect(Dressmaker.last.name).to eq('Zuzu Updated')
    expect(Dressmaker.last.max_service_quantity).to eq(12)
    expect(Dressmaker.last.end_working_date.strftime('%d/%m/%Y')).to eq(end_working_date)
  end

  context 'when the dressmaker end working date is before start working date' do
    let(:end_working_date) { "20/06/#{Time.zone.today.year - 1}" }

    it 'shows error message' do
      visit "/dressmakers/#{created_dressmaker.id}"

      fill_form(end_working_date)

      expect(page).to have_content(
        I18n.t('activerecord.errors.models.dressmaker.attributes.end_working_date.greater_than')
      )
    end
  end

  context 'when the dressmaker update fails' do
    it 'shows error message' do
      allow(Dressmakers::UpdateDressmaker).to receive(:new).and_raise(Dressmakers::UpdateDressmakerError)

      visit "/dressmakers/#{created_dressmaker.id}"

      fill_form(end_working_date)

      expect(page).to have_content(I18n.t('dressmakers.errors.update'))
    end
  end
end
