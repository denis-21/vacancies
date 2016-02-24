class StepsMenuSection < SitePrism::Section
  element :companies_step, "li a[href='/create_company_steps/companies/new']"
  element :users_step, "li a[href='/create_company_steps/users/new']"
  element :confirms_step, "li a[href='/create_company_steps/confirms/new']"
end
