require_relative 'companies_section'
require_relative 'companies_disable_section'
class ManageCompaniesPage < SitePrism::Page
  set_url '/manage/admin/companies'

  sections :companies_active, CompaniesSection, 'table.active_comapny tbody tr'
  sections :companies_disable, CompaniesDisableSection, 'table.disable_company tbody tr'

  def click_name_active_company(name_company)
    company = companies_active.find { |c| c.name.text == name_company }
    company.name.click
  end

  def delete_active_company(name_company)
    company = companies_active.find { |c| c.name.text == name_company }
    company.delete_button.click
  end

  def names_active_company
    companies_active.map { |company| company.name.text }
  end

  def click_name_disable_company(name_company)
    company = companies_disable.find { |c| c.name.text == name_company }
    company.name.click
  end

  def click_active_button(name_company)
    company = companies_disable.find { |c| c.name.text == name_company }
    company.active_button.click
  end

  def click_delete_button(name_company)
    company = companies_disable.find { |c| c.name.text == name_company }
    company.delete_button.click
  end

  def disable_company?(name_company)
    companies_disable.find { |c| c.name.text == name_company }
  end
end
