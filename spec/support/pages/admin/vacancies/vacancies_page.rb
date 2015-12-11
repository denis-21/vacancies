class AdminVacanciesPage < SitePrism::Page
  set_url '/admin/vacancies'

  elements :vacancies_link, 'table tbody tr td:first a'
  element :button_new, '.new_vacancy'

  def click_vacancy title_vacancy
    link =  vacancies_link.find{ |title|  title.text == title_vacancy }
    link.click
  end
end
