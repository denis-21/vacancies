require_relative 'companies_section'
class ManageCompaniesPage < SitePrism::Page
  set_url '/manage/admin/companies'

  sections :companies, CompaniesSection, 'table tbody tr'

  def click_company(name_company)
    company = companies.find { |c| c.name.text == name_company }
    company.name.click
  end

  def delete_company(name_company)
    company = companies.find { |c| c.name.text == name_company }
    company.delete_button.click
  end

  def names_company
    companies.map { |company| company.name.text }
  end
end
