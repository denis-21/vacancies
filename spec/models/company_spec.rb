require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'associations' do
    it { should have_many(:vacancies).dependent(:destroy) }
    it { should belong_to(:creator) }
  end

  describe 'validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:link) }
  end

  describe 'scope' do
    let!(:company) { create :company, name: 'Atest' }

    it 'returns company in asc name' do
      company1 = create :company, name: 'Btest'
      expect(Company.all.ordered).to eq([company, company1])
    end
  end

  context 'AASM' do
    let(:company) { create(:company) }

    it 'by default have disable status' do
      expect(CompanyMailer).to(receive(:disable)).and_return(double('deliver', deliver_now: true))
      expect(company.status).to eq 'disable'
    end

    it '#activate transitions from active' do
      expect(CompanyMailer).to(receive(:active)).and_return(double('deliver', deliver_now: true))
      company.activate!
      expect(company.status).to eq 'active'
    end

    it '#rejected transitions from reject' do
      expect(CompanyMailer).to(receive(:reject)).and_return(double('deliver', deliver_now: true))
      company.rejected!
      expect(company.status).to eq 'reject'
    end
  end
end
