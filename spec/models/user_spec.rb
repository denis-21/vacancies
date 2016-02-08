require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user_admin) { create :admin_user }
  let!(:user1) { create :user }
  let!(:user2) { create :user }

  describe 'associations' do
    it { should have_many(:vacancies) }
    it { should have_one(:company) }
    it { should have_one(:profile) }
  end

  describe 'scope' do
    it 'returns a users order by id asc' do
      expect(User.ordered).to match_array([user_admin, user1, user2])
    end
  end
end
