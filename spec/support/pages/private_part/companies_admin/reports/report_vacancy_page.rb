class ReportVacancyPage < SitePrism::Page
  set_url '/manage/reports/vacancies/{id}'

  element :canvas, 'canvas#canvas-summaries'
  element :type_by_month, "input[value='month']"
  element :type_by_period, "input[value='period']"
  element :star_day, "input[name='start_day']"
  element :end_day, "input[name='end_day']"
  element :button_build, "input[type='submit']"
end
