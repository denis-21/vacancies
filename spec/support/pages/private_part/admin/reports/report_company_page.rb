class ReportCompanyPage < SitePrism::Page
  set_url '/manage/admin/reports/companies/{id}'

  element :canvas, 'canvas'
end
