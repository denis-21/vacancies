require 'rails_helper'

RSpec.feature 'Registration external client for api', type: :feature do
  let!(:admin_user) { create :admin_user }
  let(:new_external_client_page) { NewExternalClient.new }
  let(:show_client_page) { ShowExternalClient.new }

  before do
    login_as admin_user
    new_external_client_page.load
  end

  scenario 'Admin external client successfully registers' do
    new_external_client_page.name.set 'Test'
    new_external_client_page.description.set 'only test client'
    new_external_client_page.button_add.click
    expect(show_client_page).to be_displayed
  end

  scenario 'Admin external client successfully registers with no description' do
    new_external_client_page.name.set 'Test'
    new_external_client_page.button_add.click
    expect(show_client_page).to be_displayed
  end

  scenario 'Admin sees the error in the registration without a name' do
    new_external_client_page.button_add.click
    expect(new_external_client_page).to have_content("Name can't be blank")
  end
end
