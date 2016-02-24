require 'rails_helper'

RSpec.feature 'EditProfile', type: :feature do
  let!(:user) { create :user }
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company: company }
  let!(:summary_with_user) { create :summary, user: user, vacancy: vacancy }
  let!(:summary) { create :summary, vacancy: vacancy }
  let(:summaries_history_page) { SummariesHistoryPage.new }

  before do
    login_as user
    summaries_history_page.load
  end

  describe 'Visit to summary history page' do
    let(:specific_summary) { summaries_history_page.summary(summary_with_user.id) }

    it 'have vacancy title' do
      expect(specific_summary.vacancy_title.text).to eq(vacancy.title)
    end

    it 'have comapny name' do
      expect(specific_summary.comapny_name.text).to eq(company.name)
    end

    it 'have status summary' do
      expect(specific_summary.status.text).to eq(summary_with_user.status)
    end

    it 'have email user' do
      expect(specific_summary.email.text).to eq(summary_with_user.email)
    end

    it 'have first_name user' do
      expect(specific_summary.first_name.text).to eq(summary_with_user.first_name)
    end

    it 'have last_name user' do
      expect(specific_summary.last_name.text).to eq(summary_with_user.last_name)
    end

    it 'not have resume that are not loaded by the current user' do
      expect(summaries_history_page.summary(summary.id)).to be_nil
    end
  end
end
