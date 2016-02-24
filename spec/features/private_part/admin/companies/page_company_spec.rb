require 'rails_helper'

RSpec.feature 'ManagePageCompany', type: :feature do
  let!(:admin) { create :admin_user }
  let!(:user) { create :user }
  let!(:company) { create :company_active, creator_id: user.id }
  let(:manage_company_page) { ManageCompanyPage.new }

  before do
    login_as admin
    manage_company_page.load(id: company.id)
  end

  scenario 'Load page vacancy' do
    expect(manage_company_page).to be_displayed
  end

  describe 'Visit to company page' do
    it 'have elements to admin company page' do
      expect(manage_company_page).to be_all_there
    end

    it 'have name company' do
      expect(manage_company_page).to have_content(company.name)
    end

    it 'have link company' do
      expect(manage_company_page).to have_content(company.link)
    end
  end
end
