# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'dressmakers/index.html.erb', type: :feature do
  it 'displays Costureiras header' do
    visit '/dressmakers'

    expect(page).to have_selector('h1', text: I18n.t('dressmakers.index'))
  end

  context 'when there no activated dressmakers' do
    it 'displays no dressmakers message' do
      visit '/dressmakers'

      expect(page).to have_selector('p', text: I18n.t('dressmakers.empty'))
    end
  end

  context 'when there are activated dressmakers' do
    let(:customers_names) { ['John Doe', 'Jose Doe', 'Maria Lion'] }
    let!(:dressmakers) do
      customers_names.each do |name|
        FactoryBot.create(:dressmaker, name:)
      end
    end

    it 'shows a dressmakers table rows' do
      visit '/dressmakers?activated=true'

      customers_names.each do |name|
        expect(page).to have_selector('th', text: name)
      end
    end

    it 'shows total number of dressmakers' do
      visit '/dressmakers'

      expect(page).to have_selector('span', text: "#{I18n.t('dressmakers.dressmakers_number')}: 3")
    end
  end

  context 'when there no fired dressmakers' do
    it 'displays no dressmakers message' do
      visit '/dressmakers'

      click_link I18n.t('dressmakers.fired')

      expect(page).to have_selector('p', text: I18n.t('dressmakers.empty_fired'))
    end
  end

  context 'when there are fired dressmakers' do
    let(:customers_names) { ['John Doe', 'Jose Doe', 'Maria Lion'] }
    let!(:dressmakers) do
      customers_names.each do |name|
        FactoryBot.create(:dressmaker, name:, end_working_date: Time.zone.today)
      end
    end

    it 'shows a dressmakers table rows' do
      visit '/dressmakers'

      click_link I18n.t('dressmakers.fired')

      customers_names.each do |name|
        expect(page).to have_selector('th', text: name)
      end
    end

    it 'shows total number of dressmakers' do
      visit '/dressmakers?activated=false'

      expect(page).to have_selector('span', text: "#{I18n.t('dressmakers.dressmakers_number')}: 3")
    end
  end

  context 'when is clicked on delete dressmaker button' do
    let!(:dressmaker) { FactoryBot.create(:dressmaker, name: 'John Doe') }

    it 'deletes the dressmaker' do
      visit '/dressmakers'

      expect(page).to have_selector('th', text: 'John Doe')

      click_on "delete-#{dressmaker.id}"

      expect(page).to have_selector('div', text: I18n.t('dressmakers.success.destroy'))
      expect(page).to_not have_selector('th', text: 'John Doe')
    end
  end
end
