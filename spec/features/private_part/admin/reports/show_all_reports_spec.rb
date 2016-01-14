require 'rails_helper'

RSpec.feature 'AllReports', type: :feature do
  let!(:company)  { create :company }
  let!(:company2) { create :company }
  let!(:show_all_reports) { ShowAllReportsPage.new }

  describe 'when user not admin' do
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
    let!(:admin) { create :admin_user }

    before do
      login_as admin
      show_all_reports.load
    end

    it 'have names companies for reports' do
      expect(show_all_reports.name_companies).to match_array(Company.pluck(:name))
    end

    scenario 'click to name company leads to a page report company' do
      show_all_reports.click_company(company.name)
      expect(ReportCompanyPage.new).to be_displayed
    end
  end
end
