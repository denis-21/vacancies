require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:picture).dependent(:destroy) }
  end
end
