require 'rails_helper'

RSpec.feature 'PageAllComapnies', type: :feature do
  let!(:company)  { create :company_active }
  let!(:company2) { create :company_active }
  let!(:company3) { create :company }

  let!(:vacancy)  { create :vacancy, company: company }
  let!(:vacancy2) { create :vacancy, company: company }

  let(:companies_page) { CompaniesAllPage.new }

  before do
    companies_page.load
  end

  describe 'Visit to companies page' do
    it 'have content all company active' do
      expect(companies_page.blocks_company.count).to eq Company.active.count
    end

    it 'have names copmanies' do
      expect(companies_page.names_companies).to match_array([company.name, company2.name])
    end

    it 'have count vacancies to company' do
      expect(companies_page.count_vacancies_company(company.name)).to eq("Count vacancies : #{company.vacancies.count}")
    end
  end

  scenario 'Click to block company leads to a company page' do
    companies_page.click_company(company.name)
    expect(CompanyShowPage.new).to be_displayed
  end
end
