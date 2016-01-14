class ReportCompanyPage < SitePrism::Page
  set_url '/admin/reports/companies/{id}'

  element :canvas, 'canvas'

  def data_report
    canvas['data-report']
  end
end
