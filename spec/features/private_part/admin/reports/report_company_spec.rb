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
end
