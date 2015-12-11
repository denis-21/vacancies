require 'rails_helper'

RSpec.feature "AdminPageCopmanies", type: :feature do
  let!(:company)  { create :company }
  let!(:company2) { create :company }

  let(:admin_companies_page) { AdminCompaniesPage.new }

  before do
    http_basic_login('user','123456')
    admin_companies_page.load
  end

  describe 'Visit to companies page' do

    it 'have elements to admin companies page' do
      expect(admin_companies_page).to be_all_there
    end

    it 'have content title companies' do
      expect(admin_companies_page.companies_link.count).to eq Company.all.count
    end

  end

  scenario 'Click to title company leads to a page company' do
    admin_companies_page.click_company(company.name)

    expect(AdminCompanyPage.new).to be_displayed
  end

  scenario 'Click to button new company leads to a page new company' do
    admin_companies_page.button_new.click

    expect(AdminNewCompanyPage.new).to be_displayed
  end
end
