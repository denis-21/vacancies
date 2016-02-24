require 'rails_helper'

RSpec.feature 'ManagePageCopmanies', type: :feature do
  let!(:admin) { create :admin_user }
  let!(:company) { create :company_active }
  let!(:company_disable) { create :company }
  let(:manage_companies_page) { ManageCompaniesPage.new }

  before do
    login_as admin
    manage_companies_page.load
  end

  context 'Active company' do
    it 'have content title companies' do
      expect(manage_companies_page.names_active_company).to match_array(Company.active.pluck(:name))
    end

    scenario 'Click to title company leads to a page company' do
      manage_companies_page.click_name_active_company(company.name)
      expect(ManageCompanyPage.new).to be_displayed
    end

    scenario 'Click delete button' do
      manage_companies_page.delete_active_company(company.name)
      expect(manage_companies_page).not_to have_content(company.name)
    end
  end

  context 'Disable company' do
    scenario 'Click to title company leads to a page company' do
      manage_companies_page.click_name_disable_company(company_disable.name)
      expect(ManageCompanyPage.new).to be_displayed
    end

    scenario 'click active button company', js: true do
      manage_companies_page.click_active_button(company_disable.name)
      wait_for_ajax_finishing
      expect(manage_companies_page.disable_company?(company_disable.name)).to be_nil
    end

    scenario 'click delete button company', js: true do
      manage_companies_page.click_delete_button(company_disable.name)
      expect(manage_companies_page).not_to have_content(company_disable.name)
    end
  end
end
