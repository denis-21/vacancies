require 'rails_helper'

RSpec.feature 'AdminPageCopmanies', type: :feature do
  let!(:user) { create :user }
  let!(:company)  { create :company, creator_id: user.id }
  let!(:company2) { create :company, creator_id: user.id }

  let(:admin_companies_page) { AdminCompaniesPage.new }

  before do
    login_as user
    admin_companies_page.load
  end

  describe 'Visit to companies page' do
    it 'have elements to admin companies page' do
      expect(admin_companies_page).to be_all_there
    end

    it 'have content title companies' do
      expect(admin_companies_page.companies_link.count).to eq(Company.count)
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

  scenario 'Click delete button' do
    admin_companies_page.delete_buttons.first.click
    expect(admin_companies_page).to have_content(company2.name)
  end
end
