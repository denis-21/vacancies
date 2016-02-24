require 'rails_helper'

RSpec.feature 'PageShowComapny', type: :feature do
  let!(:company)  { create :company_active }
  let!(:vacancy)  { create :vacancy, company: company }
  let!(:vacancy2) { create :vacancy, company: company }

  let(:company_show_page) { CompanyShowPage.new }

  before do
    company_show_page.load(id: company.id)
  end

  scenario 'Load page company' do
    expect(company_show_page).to be_displayed
  end

  describe 'Visit to company page' do
    it 'have name company' do
      expect(company_show_page.name_company.text).to eq(company.name)
    end
    it 'have link company' do
      expect(company_show_page.link.text).to eq(company.link)
    end

    it 'have title vacancies' do
      expect(company_show_page.title_vacancies).to match_array([vacancy.title, vacancy2.title])
    end
  end

  scenario 'click title vacancy leads to a vacancy page' do
    company_show_page.click_vacancy(vacancy.title)
    expect(VacancyPage.new).to be_displayed
  end
end
