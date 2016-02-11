require 'rails_helper'

RSpec.feature 'ShowAllReports', type: :feature do
  let!(:show_all_reports) { ManagerShowAllReportsPage.new }

  describe 'when user not manage company' do
    let!(:user) { create :user }

    before do
      login_as user
    end

    scenario 'show reports' do
      show_all_reports.load
      expect(show_all_reports).to have_content('You do not have permission to view')
    end
  end

  describe 'when user admin' do
    let!(:manager) { create :user }
    let!(:company) { create :company_active, creator_id: manager.id }
    let!(:vacancy) { create :vacancy, company: company, creator_id: manager.id }
    let!(:vacancy2) { create :vacancy, company: company, creator_id: manager.id }

    before do
      login_as manager
      show_all_reports.load
    end

    it 'have title vacancies for reports' do
      expect(show_all_reports.name_vacancies).to match_array([vacancy.title, vacancy2.title])
    end

    scenario 'click to title vacancy leads to a page report vacancy' do
      show_all_reports.click_vacancy(vacancy2.title)
      expect(ReportVacancyPage.new).to be_displayed
    end
  end
end
