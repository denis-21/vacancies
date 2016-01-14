require 'rails_helper'

RSpec.feature 'Update company', type: :feature do
  let!(:user) { create :user }
  let!(:company) { create :company, creator_id: user.id }
  let(:edit_company_page) { ManageEditCompanyPage.new }

  before do
    login_as user
    edit_company_page.load(id: company.id)
  end

  scenario 'when filled with all the data' do
    edit_company_page.name.set 'Test company'
    edit_company_page.button_add.click
    expect(ManageCompanyPage.new).to have_content('Test company')
  end

  scenario 'when do not fill in the name company' do
    edit_company_page.name.set ''
    edit_company_page.button_add.click
    expect(edit_company_page).to have_content("Name can't be blank")
  end

  scenario 'when do not fill in the link company' do
    edit_company_page.link.set ''
    edit_company_page.button_add.click
    expect(edit_company_page).to have_content("Link can't be blank")
  end
end
