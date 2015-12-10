require 'pages/search_section'
class SearchPage < SitePrism::Page
  set_url "/search_vacancies{?query*}"

  elements :link_vacancies, ".list-group a h2"

  section  :search, SearchSection, "#search-form"


  def title_vacancies
    link_vacancies.map &:text
  end

  def click_vacancy title_vacancy
    link =  link_vacancies.find{ |title|  title.text == title_vacancy }
    link.find(:xpath, '..').click
  end

end