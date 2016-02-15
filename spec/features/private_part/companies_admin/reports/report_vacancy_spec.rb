require 'rails_helper'

RSpec.feature 'ReportVacancy', type: :feature do
  let!(:manager)  { create :user_with_company }
  let!(:company)  { manager.company }
  let!(:vacancy) { create :vacancy, company: company, creator_id: manager.id }
  let!(:summary) { create :summary, vacancy: vacancy }
  let!(:summary2) { create :summary, vacancy: vacancy }
  let!(:report_vacancy_page) { ReportVacancyPage.new }

  before do
    login_as manager
    report_vacancy_page.load(id: vacancy.id)
  end

  it 'have canvas' do
    expect(report_vacancy_page).to have_canvas
  end
end
