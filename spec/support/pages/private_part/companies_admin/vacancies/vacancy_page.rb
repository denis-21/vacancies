class ManageVacancyPage < SitePrism::Page
  set_url '/manage/vacancies/{id}'

  element :edit_button, '.btn-warning'
  element :delete_button, '.btn-danger'
end
