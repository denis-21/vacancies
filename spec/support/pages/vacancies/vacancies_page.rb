class VacanciesPage < SitePrism::Page
  set_url '/'

  sections :link_vacancies, VacanciesLinkSection, '.list-group a'

  section :search, SearchSection, '#search-form'

  def click_vacancy(title_vacancy)
   link = link_vacancies.find{ |link| link.title.text == title_vacancy }
   link.root_element.click
  end
end
