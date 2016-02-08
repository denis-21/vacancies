require 'rails_helper'

RSpec.feature 'ManagePageCopmanies', type: :feature do
  let!(:admin) { create :admin_user }
  let!(:user) { create :user }
  let!(:company) { create :company_active, creator_id: user.id }
  let(:manage_companies_page) { ManageCompaniesPage.new }

  before do
    login_as admin
    manage_companies_page.load
  end

  describe 'Visit to companies page' do
    it 'have elements to admin companies page' do
      expect(manage_companies_page).to be_all_there
    end

    it 'have content title companies' do
      expect(manage_companies_page.names_company).to match_array(Company.pluck(:name))
    end
  end

  scenario 'Click to title company leads to a page company' do
    manage_companies_page.click_company(company.name)
    expect(ManageCompanyPage.new).to be_displayed
  end

  scenario 'Click delete button' do
    manage_companies_page.delete_company(company.name)
    expect(manage_companies_page).not_to have_content(company.name)
  end
end
