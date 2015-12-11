class SearchSection < SitePrism::Section
  element :select_company, "#company_id"
  element :select_country, "#country"
  element :search_field_city, "#city"
  element :search_button, "input[value='Search']"

  def set_company company
    select_company.select(company)
    self
  end

  def set_country country
    select_country.select(country)
    self
  end

  def set_city city
    search_field_city.set(city)
    self
  end

  def submit
    search_button.click
  end
end
