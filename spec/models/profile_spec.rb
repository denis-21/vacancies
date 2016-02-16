require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_one(:picture).dependent(:destroy) }
  end

  describe 'Delegate' do
    it { should delegate_method(:image).to(:picture) }
  end

  describe '#default_image' do
    let(:profile) { create :profile }

    it 'return special image url' do
      expect(profile.default_image).to eq('http://placehold.it/300x300&text=Avatar')
    end
  end
end
