require 'rails_helper'

RSpec.feature 'AdminUsersPage', type: :feature do
  let!(:admin) { create :admin_user }
  let(:admin_users_page) { AdminUsersPage.new }

  before do
    login_as admin
  end

  describe 'Visit to users page' do
    let!(:user1) { create :user }
    let!(:user2) { create :user }
    let!(:company) { create :company_active, creator_id: user1.id  }
    let!(:company2) { create :company_active, creator_id: user2.id }

    before { admin_users_page.load }

    it 'have content Email/Login User' do
      expect(admin_users_page.users_email).to match_array([user1.email, user2.email])
    end
  end

  context 'When present unblock user' do
    let!(:user1) { create :user }
    let!(:company) { create :company, creator_id: user1.id, status: 'active' }

    before { admin_users_page.load }

    scenario 'Click block user', js: true do
      admin_users_page.click_block_user(user1.email)
      expect(admin_users_page.user_by(user1.email)).to have_unblock_button
    end
  end

  context 'When present block user' do
    let!(:user1) { create :user, locked_at: Time.zone.today }
    let!(:company) { create :company, creator_id: user1.id, status: 'active' }

    before { admin_users_page.load }

    scenario 'Click unblock user', js: true do
      admin_users_page.click_unblock_user(user1.email)
      expect(admin_users_page.user_by(user1.email)).to have_block_button
    end
  end
end
