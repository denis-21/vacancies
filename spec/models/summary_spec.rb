require 'rails_helper'

RSpec.describe Summary, type: :model do
  describe 'associations' do
    it { should belong_to(:vacancy) }
  end

  describe 'validation' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:file) }
  end

  context 'AASM' do
    let!(:vacancy) { create(:vacancy) }
    let(:summary) { create(:summary, vacancy: vacancy) }

    it 'by default have received status' do
      expect(SummaryMailer).to(receive(:received)).and_return(double('deliver', deliver_now: true))
      expect(summary.status).to eq 'received'
    end

    it '#accept transitions from received' do
      expect(SummaryMailer).to(receive(:accepted)).and_return(double('deliver', deliver_now: true))
      summary.accept!
      expect(summary.status).to eq 'accepted'
    end

    it '#reject transitions from received' do
      expect(SummaryMailer).to(receive(:rejected)).and_return(double('deliver', deliver_now: true))
      summary.reject!
      expect(summary.status).to eq 'rejected'
    end
  end

  describe '#full_name' do
    let!(:vacancy) { create(:vacancy) }
    let(:summary) { create(:summary, vacancy: vacancy) }

    it 'return first_name + last_name' do
      expect(summary.full_name).to eq(summary.first_name + ' ' + summary.last_name)
    end
  end

  describe '#update_status' do
    let!(:vacancy) { create(:vacancy) }
    let(:summary) { create(:summary, vacancy: vacancy) }

    it 'change status to accepted if param = accept' do
      summary.update_status('accept')
      expect(summary.status).to eq('accepted')
    end

    it 'change status to rejected if param = reject' do
      summary.update_status('reject')
      expect(summary.status).to eq('rejected')
    end

    it 'not change status if param = test' do
      summary.update_status('test')
      expect(summary.status).to eq('received')
    end
  end
end
