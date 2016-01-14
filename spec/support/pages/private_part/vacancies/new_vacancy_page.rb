class ManageNewVacancyPage < SitePrism::Page
  set_url '/manage/vacancies/new'

  element :company, "select[name='vacancy[company_id]']"
  element :country, "select[name='vacancy[country]']"
  element :city, "input[name='vacancy[city]']"
  element :title, "input[name='vacancy[title]']"
  element :description, "textarea[name='vacancy[description]']"
  element :deadline_year, "select[name='vacancy[deadline(1i)]']"
  element :deadline_month, "select[name='vacancy[deadline(2i)]']"
  element :deadline_day, "select[name='vacancy[deadline(3i)]']"
  element :button_add, "input[type='submit']"
end
