require_relative 'blocks_companies_section'

class CompaniesAllPage < SitePrism::Page
  set_url '/companies'

  sections :blocks_company, BlocksCompaniesSection, 'ul.logotypes-squares li a'

  def click_company(name)
    company = blocks_company.find { |c| c.name_company.text == name }
    company.root_element.click
  end

  def names_companies
    blocks_company.map(&:company_name_text)
  end

  def count_vacancies_company(name)
    company = blocks_company.find { |c| c.name_company.text == name }
    company.count_vacancies.text
  end
end
