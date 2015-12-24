require 'rails_helper'

RSpec.describe ExternalClient, type: :model do
  describe 'validation' do
    it { should validate_presence_of(:name) }
  end

  describe '#generate_secret_key' do
    let(:external_client) { create :external_client }

    it 'expected that generate code afte create extarnal client' do
      secret_key = Digest::SHA1.hexdigest(external_client.id.to_s + external_client.name + external_client.created_at.to_s)
      expect(external_client.secret_key).to eq(secret_key)
    end
  end
end
