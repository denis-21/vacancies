require 'rails_helper'

RSpec.feature 'Add new company', type: :feature do
  let!(:user) { create :user }
  let(:add_new_company_page) { ManageNewCompanyPage.new }

  before do
    login_as user
    add_new_company_page.load
  end

  scenario 'when filled with all the data' do
    add_new_company_page.name.set 'Test company'
    add_new_company_page.link.set 'http://test.com'
    add_new_company_page.image.set Rails.root.join('spec/support/assets/test.jpg')
    add_new_company_page.button_add.click
    expect(ManageCompanyPage.new).to be_displayed
  end

  scenario 'when do not fill in the name company' do
    add_new_company_page.link.set 'http://test.com'
    add_new_company_page.image.set Rails.root.join('spec/support/assets/test.jpg')
    add_new_company_page.button_add.click
    expect(add_new_company_page).to have_content("Name can't be blank")
  end

  scenario 'when do not fill in the link company' do
    add_new_company_page.name.set 'Test company'
    add_new_company_page.image.set Rails.root.join('spec/support/assets/test.jpg')
    add_new_company_page.button_add.click
    expect(add_new_company_page).to have_content("Link can't be blank")
  end
end
