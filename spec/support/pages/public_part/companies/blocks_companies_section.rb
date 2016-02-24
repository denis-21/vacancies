class BlocksCompaniesSection < SitePrism::Section
  element :name_company, 'h3 > b'
  element :count_vacancies, 'span'

  delegate :text, to: :name_company, prefix: :company_name
end
