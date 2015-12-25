
require_relative 'vacancies_section'
class AdminVacanciesPage < SitePrism::Page
  set_url '/admin/vacancies'

  element :button_new, '.new_vacancy'
  sections :vacancies, VacainciesSection, 'table tbody tr'

  def click_vacancy(title_vacancy)
    vacancy_by(title_vacancy).name.click
  end

  def delete_vacancy(title_vacancy)
    vacancy_by(title_vacancy).delete_button.click
  end

  def vacancy_by(title_vacancy)
    vacancies.find { |vacancy| vacancy.name.text == title_vacancy }
  end

  def vacancies_title
    vacancies.map { |vacancy| vacancy.name.text }
  end
end
