require 'rails_helper'

RSpec.feature 'CreateSummary', type: :feature do
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company: company }
  let!(:summary_data) { attributes_for :summary }
  let(:summary_new_page) { SummaryNewPage.new }
  let(:vacancy_page) { VacancyPage.new }

  before do
    summary_new_page.load(id: vacancy.id)
  end

  describe 'upload summary' do
    scenario 'fill in the form' do
      summary_new_page.email.set summary_data[:email]
      summary_new_page.first_name.set summary_data[:first_name]
      summary_new_page.last_name.set summary_data[:last_name]
      summary_new_page.file.set Rails.root.join('spec/support/assets/Screen Shot 2015-12-16 at 09.36.28.pdf')
      summary_new_page.submit.click
      expect(vacancy_page).to have_content('Resume was successfully sent')
    end

    scenario 'fill all in the form, except file' do
      summary_new_page.email.set summary_data[:email]
      summary_new_page.first_name.set summary_data[:first_name]
      summary_new_page.last_name.set summary_data[:last_name]
      summary_new_page.submit.click
      expect(summary_new_page).to have_content("File can't be blank")
    end
  end
end
