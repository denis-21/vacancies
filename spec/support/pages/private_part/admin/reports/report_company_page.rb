class ReportCompanyPage < SitePrism::Page
  set_url '/admin/reports/companies/{id}'

  element :canvas, 'canvas'

  element :type_by_month_year, "input[value='month_year']"
  element :type_by_period, "input[value='period']"
  element :star_day, "input[name='company_report_start_day']"
  element :end_day, "input[name='company_report_end_day']"
  element :button_build, "input[type='submit']"
end
