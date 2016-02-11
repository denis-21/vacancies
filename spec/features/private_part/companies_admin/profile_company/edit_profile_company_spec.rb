require 'rails_helper'

RSpec.feature 'EditProfileCompany', type: :feature do
  let!(:manager)  { create :user }
  let!(:company)  { create :company_active, creator_id: manager.id }
  let(:edit_profile_company_page) { EditProfileCompanyPage.new }

  before do
    login_as manager
    edit_profile_company_page.load
  end

  scenario 'when filled with all the data' do
    edit_profile_company_page.name.set 'Test company'
    edit_profile_company_page.button_add.click
    expect(ProfileCompanyPage.new).to have_content('Test company')
  end

  scenario 'when do not fill in the name company' do
    edit_profile_company_page.name.set ''
    edit_profile_company_page.button_add.click
    expect(edit_profile_company_page).to have_content("Name can't be blank")
  end

  scenario 'when do not fill in the link company' do
    edit_profile_company_page.link.set ''
    edit_profile_company_page.button_add.click
    expect(edit_profile_company_page).to have_content("Link can't be blank")
  end
end
