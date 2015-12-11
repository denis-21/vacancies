require 'rails_helper'

RSpec.feature "AdminPageVacancies", type: :feature do
  let!(:company)  { create :company }
  let!(:company2) { create :company }

  let!(:vacancy)  { create :vacancy,company:company }
  let!(:vacancy2) { create :vacancy,company:company2 }

  let(:admin_vacancies_page) { AdminVacanciesPage.new }

  before do
    http_basic_login('user','123456')
    admin_vacancies_page.load
  end

  describe 'Visit to vacancies page' do

    it 'have elements to admin vacancies page' do
      expect(admin_vacancies_page).to be_all_there
    end

    it 'have content title vacancies' do
      expect(admin_vacancies_page.vacancies_link.count).to eq Vacancy.all.count
    end

  end

  scenario 'Click to title vacancy leads to a page vacancy' do
    admin_vacancies_page.click_vacancy(vacancy2.title)

    expect(AdminVacancyPage.new).to be_displayed
  end

  scenario 'Click to button new vacancy leads to a page new vacancy' do
    admin_vacancies_page.button_new.click

    expect(AdminNewVacancyPage.new).to be_displayed
  end
end
