require 'rails_helper'

RSpec.feature 'Add new company', type: :feature do
  let!(:user) { create :user }
  # let(:file) { fixture_file_upload('spec/support/assets/test.jpg', 'image/jpeg') }
  let(:add_new_company_page) { AdminNewCompanyPage.new }

  before do
    login_as user
    add_new_company_page.load
  end

  scenario 'Add company' do
    add_new_company_page.name.set 'Test company'
    add_new_company_page.link.set 'http://test.com'
    add_new_company_page.image.set Rails.root.join('spec/support/assets/test.jpg')
    add_new_company_page.button_add.click

    expect(AdminCompanyPage.new).to be_displayed
  end
end
