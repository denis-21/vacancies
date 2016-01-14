require 'rails_helper'

RSpec.feature 'PageSearch', type: :feature do
  let!(:company)  { create :company }
  let!(:company2) { create :company }
  let!(:vacancy)  { create :vacancy, company: company }
  let!(:vacancy2) { create :vacancy, company: company2 }
  let!(:vacancy3) { create :vacancy, company: company2 }
  let(:search_page) { SearchPage.new }

  before do
    search_page.load
  end

  scenario 'Click on the search button after selecting companies' do
    search_page.search.set_company(company2.name).submit

    expect(search_page).to have_content(vacancy2.title)
    expect(search_page).to have_content(vacancy3.title)
  end

  scenario 'Click on the search button after selecting the country' do
    search_page.search.set_country(vacancy.country).submit

    expect(search_page).to have_content(vacancy.title)
  end

  scenario 'Click on the search button after enter the city' do
    search_page.search.set_city(vacancy2.city).submit

    expect(search_page).to have_content(vacancy2.title)
  end

  scenario 'Click on the search button after selecting the companies and country' do
    search_page.search.set_company(company2.name).set_country(vacancy2.country).submit

    expect(search_page).to have_content(vacancy2.title)
  end

  scenario 'Click on the search button after selecting the companies and country and enter the city' do
    search_page.search.set_company(company2.name).set_country(vacancy2.country).set_city(vacancy2.city).submit

    expect(search_page).to have_content(vacancy2.title)
  end

  scenario 'Click on the search button after selecting the companies and enter the city' do
    search_page.search.set_company(company.name).set_city(vacancy.city).submit

    expect(search_page).to have_content(vacancy.title)
  end
  scenario 'Click on the search button after selecting the country and enter the city' do
    search_page.search.set_country(vacancy.country).set_city(vacancy.city).submit

    expect(search_page).to have_content(vacancy.title)
  end

  scenario 'Click to title vacancy leads to a page vacancy' do
    search_page.click_vacancy(vacancy.title)
    expect(VacancyPage.new).to be_displayed
  end
end
