class ConfirmsStepPage < SitePrism::Page
  set_url '/create_company_steps/confirms/new'

  element :confim_button, "a[href='/create_company_steps/confirms']"
end
