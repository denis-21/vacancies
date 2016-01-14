require 'support/pages/public_part/vacancies/vacancies_links_section'
require_relative 'search_section'
class SearchPage < SitePrism::Page
  set_url "/search_vacancies{?query*}"

  sections :link_vacancies, VacanciesLinkSection, '.list-group a'

  section :search, SearchSection, '#search-form'

  def click_vacancy(title_vacancy)
    link = link_vacancies.find { |l| l.title.text == title_vacancy }
    link.root_element.click
  end
end
