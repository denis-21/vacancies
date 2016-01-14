require 'rails_helper'

RSpec.feature 'Show all external clients', type: :feature do
  let!(:admin_user) { create :admin_user }
  let!(:external_clients) { create :external_client }
  let(:external_client_page) { ShowExternalClient.new }

  before do
    login_as admin_user
    external_client_page.load(id: external_clients.id)
  end

  scenario 'Load page client' do
    expect(external_client_page).to be_displayed
  end

  describe 'Visit to one external client page' do
    it 'have elements to external client page' do
      expect(external_client_page).to be_all_there
    end

    it 'have name client' do
      expect(external_client_page).to have_content(external_clients.name)
    end

    it 'have description client' do
      expect(external_client_page).to have_content(external_clients.description)
    end

    it 'have secret_key client' do
      expect(external_client_page).to have_content(external_clients.secret_key)
    end
  end

  scenario 'Click delete button' do
    external_client_page.delete_button.click
  end
end
