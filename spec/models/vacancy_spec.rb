require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  let!(:vacancy) { create :vacancy,company_id: 1 }
  let!(:vacancy1) { create :vacancy,company_id: 1 }
  let!(:vacancy2) { create :vacancy,company_id: 2 }

  describe 'associations' do
    it { should belong_to(:company) }
  end

  describe 'validation' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:country) }
  end

  describe 'scope' do
    it 'returns a vacancy by company' do
      expect(Vacancy.search_company(1)).to match_array([vacancy,vacancy1])
    end
    it 'returns a vacancy by city' do
      expect(Vacancy.search_city(vacancy.city)).to match_array([vacancy])
    end
    it 'returns a vacancy by country' do
      expect(Vacancy.search_country(vacancy2.country)).to match_array([vacancy2])
    end
    it 'returns vacancy in desc id' do
      expect(Vacancy.all.ordered).to eq([vacancy2,vacancy1,vacancy])
    end
  end
end

