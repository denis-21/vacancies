require 'rails_helper'

RSpec.feature 'Show all external clients', type: :feature do
  let!(:admin_user) { create :admin_user }
  let!(:external_clients) { create :external_client }
  let(:external_clients_page) { AllExternalClients.new }

  before do
    login_as admin_user
    external_clients_page.load
  end

  describe 'Visit to external clients page' do
    it 'have elements to external clients page' do
      expect(external_clients_page).to be_all_there
    end

    it 'have all name clients on page' do
      external_clients_page.name_clients
      expect(external_clients_page.name_clients).to match_array(ExternalClient.pluck(:name))
    end
  end

  scenario 'Click to name client leads to a page client' do
    external_clients_page.click_client(external_clients.name)
    expect(ShowExternalClient.new).to be_displayed
  end

  scenario 'Click to button new external client leads to a page new client' do
    external_clients_page.button_new.click
    expect(NewExternalClient.new).to be_displayed
  end

  scenario 'Click delete button' do
    external_clients_page.delete_buttons.first.click
    expect(external_clients_page).not_to have_content(external_clients.name)
  end
end
