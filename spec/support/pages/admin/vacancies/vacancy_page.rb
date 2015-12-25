class AdminVacancyPage < SitePrism::Page
  set_url '/admin/vacancies/{id}'

  element :edit_button, '.btn-warning'
  element :delete_button, '.btn-danger'
end
