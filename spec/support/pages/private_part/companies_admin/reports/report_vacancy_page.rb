class ReportVacancyPage < SitePrism::Page
  set_url '/manage/reports/vacancies/{id}'

  element :canvas, 'canvas#canvas-summaries'
end
