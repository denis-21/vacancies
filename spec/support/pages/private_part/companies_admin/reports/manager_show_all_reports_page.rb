require_relative 'vacancies_section'

class ManagerShowAllReportsPage < SitePrism::Page
  set_url '/manage/reports'

  section :vacancies_reports, VacanciesReportsSection, '.vacancies_reports'

  def name_vacancies
    vacancies_reports.name_vacancies.map(&:text)
  end

  def click_vacancy(title_vacancy)
    vacancy = vacancies_reports.name_vacancies.find { |title| title.text == title_vacancy }
    vacancy.click
  end
end
