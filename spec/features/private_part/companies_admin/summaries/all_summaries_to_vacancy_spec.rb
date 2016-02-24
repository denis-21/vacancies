require 'rails_helper'

RSpec.feature 'AllSummariesToVacancy', type: :feature do
  let!(:manager)  { create :user_with_company }
  let!(:company)  { manager.company }
  let!(:vacancy) { create :vacancy, company: company, creator_id: manager.id }
  let!(:summary) { create :summary, vacancy: vacancy }
  let!(:summary_accepted) { create :summary_accepted, vacancy: vacancy }
  let!(:summary_rejected) { create :summary_rejected, vacancy: vacancy }
  let(:all_summaries_page) { AllSummariesToVacancyPage.new }

  before do
    login_as manager
    all_summaries_page.load(id: vacancy.id)
  end

  describe 'Visit to summaries page' do
    context 'new summaries' do
      let(:new_summary) { all_summaries_page.new_summary(summary.id) }

      it 'have content email' do
        expect(new_summary.email.text).to eq(summary.email)
      end
      it 'have content first_name' do
        expect(new_summary.first_name.text).to eq(summary.first_name)
      end
      it 'have content last_name' do
        expect(new_summary.last_name.text).to eq(summary.last_name)
      end
      it 'have button change status' do
        expect(new_summary).to be_all_there
      end
    end

    context 'accepted summaries' do
      let(:accepted_summary) { all_summaries_page.accepted_summary(summary_accepted.id) }

      it 'have content email' do
        expect(accepted_summary.email.text).to eq(summary_accepted.email)
      end
      it 'have content first_name' do
        expect(accepted_summary.first_name.text).to eq(summary_accepted.first_name)
      end
      it 'have content last_name' do
        expect(accepted_summary.last_name.text).to eq(summary_accepted.last_name)
      end
    end

    context 'rejected summaries' do
      let(:rejected_summary) { all_summaries_page.rejected_summary(summary_rejected.id) }

      it 'have content email' do
        expect(rejected_summary.email.text).to eq(summary_rejected.email)
      end
      it 'have content first_name' do
        expect(rejected_summary.first_name.text).to eq(summary_rejected.first_name)
      end
      it 'have content last_name' do
        expect(rejected_summary.last_name.text).to eq(summary_rejected.last_name)
      end
    end
  end

  describe 'action on this page' , js: true do
    let(:new_summary) { all_summaries_page.new_summary(summary.id) }

    scenario 'click to button accept' do
      new_summary.button_to_accept.click
      wait_for_ajax_finishing
      expect(all_summaries_page.new_summaries.count).to eq(Summary.received.count)
      expect(all_summaries_page.accepted_summary(summary.id)).not_to be_nil
    end

    scenario 'click to button reject' do
      new_summary.button_to_reject.click
      wait_for_ajax_finishing
      expect(all_summaries_page.new_summaries.count).to eq(Summary.received.count)
      expect(all_summaries_page.rejected_summary(summary.id)).not_to be_nil
    end
  end
end
