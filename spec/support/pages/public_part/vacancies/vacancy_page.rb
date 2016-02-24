class VacancyPage < SitePrism::Page
  set_url '/vacancies/{id}'

  element :button_send_resume, '.send_resume'
end
