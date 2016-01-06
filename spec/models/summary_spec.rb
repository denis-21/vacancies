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
end
