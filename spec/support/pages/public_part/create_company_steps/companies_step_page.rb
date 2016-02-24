class CompaniesStepPage < SitePrism::Page
  set_url '/create_company_steps/companies/new'

  element :continent, "select[name='company[continent]']"
  element :country, "select[name='company[country]']"
  element :city, "input[name='company[city]']"
  element :name, "input[name='company[name]']"
  element :link, "input[name='company[link]']"
  element :next_button, "input[type='submit']"

  def submit_form(data)
    continent.select data[:continent]
    country.select data[:country]
    city.set data[:city]
    name.set data[:name]
    link.set data[:link]
    next_button.click
  end
end
