require 'pages/search_section'
class VacanciesPage < SitePrism::Page
  set_url '/'


  elements :link_vacancies, "table tbody tr td a"

  section  :search, SearchSection, "#search-form"


  def click_vacancy title_vacancy
   link =  link_vacancies.find{ |title|  title.text == title_vacancy }
   link.click
  end

end