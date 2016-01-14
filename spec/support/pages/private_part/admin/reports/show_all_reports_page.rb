class ShowAllReportsPage < SitePrism::Page
  set_url '/manage/admin/reports'

  section :companies_reports, CompaniesReportsSection, '.companies_reports'

  def name_companies
    companies_reports.name_companies.map(&:text)
  end

  def click_company(name_company)
    company = companies_reports.name_companies.find { |name| name.text == name_company }
    company.click
  end
end
