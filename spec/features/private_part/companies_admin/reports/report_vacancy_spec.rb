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

  scenario 'select period and set start,end day and click build button', js: true do
    report_vacancy_page.type_by_period.set true
    report_vacancy_page.star_day.set '09.01.2016'
    report_vacancy_page.end_day.set '09.02.2016'
    report_vacancy_page.button_build.click
    expect(report_vacancy_page).to have_canvas
  end
end
