require 'rails_helper'

RSpec.feature 'AdminUsersPage', type: :feature do
  let!(:user) { create :admin_user }

  let(:admin_users_page) { AdminUsersPage.new }

  before do
    login_as user
    admin_users_page.load
  end

  describe 'Visit to users page' do
    it 'have content Email/Login User' do
      expect(admin_users_page.users_email.count).to eq User.all.count
    end
  end

  context 'When present unblock user' do
    let!(:user1) { create :user }

    it 'have button block' do
      expect(admin_users_page).to have_block_buttons
    end

    scenario 'Click block user', js: true do
      admin_users_page.click_block_user
      admin_users_page.wait_for_unblock_buttons
      expect(admin_users_page).to have_unblock_buttons
    end
  end

  context 'When present block user' do
    let!(:user1) { create :user, locked_at: Time.zone.today }

    scenario 'Click unblock user', js: true do
      admin_users_page.click_unblock_user
      admin_users_page.wait_for_block_buttons
      expect(admin_users_page).to have_block_buttons
    end
  end
end
