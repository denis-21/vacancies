require 'rails_helper'

RSpec.feature "AdminPageCompany", type: :feature do
  let!(:company)  { create :company }

  let(:admin_company_page) { AdminCompanyPage.new }

  before do
    http_basic_login('user','123456')
    admin_company_page.load(id: company.id)
  end

  scenario 'Load page vacancy' do
    expect(admin_company_page).to be_displayed
  end


  describe 'Visit to company page' do

    it 'have elements to admin company page' do
      expect(admin_company_page).to be_all_there
    end

    it 'have name company' do
      expect(admin_company_page).to have_content (company.name)
    end

    it 'have link company' do
      expect(admin_company_page).to have_content (company.link)
    end


  end
end
