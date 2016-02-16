require 'rails_helper'

RSpec.feature 'ReportComapny', type: :feature do
  let!(:admin) { create :admin_user }
  let!(:company) { create :company }
  let!(:vacancy) { create :vacancy, company_id: company.id }
  let!(:vacancy2) { create :vacancy, company_id: company.id }
  let!(:vacancy3) { create :vacancy, company_id: company.id }
  let!(:report_company_page) { ReportCompanyPage.new }

  before do
    login_as admin
    report_company_page.load(id: company.id)
  end

  it 'have canvas' do
    expect(report_company_page).to have_canvas
  end

  scenario 'select period and set start,end day and click build button' do
    report_company_page.type_by_period.set true
    report_company_page.star_day.set '09.01.2016'
    report_company_page.end_day.set '09.02.2016'
    report_company_page.button_build.click
    expect(report_company_page).to have_canvas
  end
end
