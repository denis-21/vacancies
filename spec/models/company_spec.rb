require 'rails_helper'

RSpec.describe Company, type: :model do
  let!(:company) { create :company, name:'Atest'}
  describe 'associations' do
    it { should have_many(:vacancies).dependent(:destroy) }

  end

  describe 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:link) }

  end

  describe 'scope' do
    it 'returns company in asc name' do
      company1 = create :company,name:'Btest'
      expect(Company.all.ordered).to eq([company, company1])
    end
  end
end

