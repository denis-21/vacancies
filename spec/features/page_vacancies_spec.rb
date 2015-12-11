require 'rails_helper'
require 'pages/vacancies_page'
require 'pages/vacancy_page'
require 'pages/search_page'

RSpec.feature "PageVacancies", type: :feature do
  let!(:company)  { create :company }
  let!(:company2) { create :company }

  let!(:vacancy)  { create :vacancy,company:company }
  let!(:vacancy2) { create :vacancy,company:company2 }

  let(:vacancies_page) { VacanciesPage.new }

  before do
    vacancies_page.load
  end

  describe 'Visit to vacancies page' do

    it 'have element to vacancies page' do
      expect(vacancies_page).to be_all_there
    end

    it 'have element to form search on vacancies page' do
      expect(vacancies_page.search).to be_all_there
    end

    it 'have content title vacancies' do
      expect(vacancies_page.link_vacancies.count).to eq Vacancy.all.count
    end
  end

  scenario 'Click to title vacancy leads to a page vacancy' do
    vacancies_page.click_vacancy(vacancy2.title)

    expect(VacancyPage.new).to be_displayed
  end

  scenario 'Click to search button leads to a page search' do
    vacancies_page.search.submit

    expect(SearchPage.new).to be_displayed
  end
end
