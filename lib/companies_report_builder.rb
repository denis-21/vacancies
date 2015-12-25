class CompaniesReportBuilder
  def initialize(company)
    @company = company
  end

  def hash
    { labels: @stats.keys.map { |dt| dt.to_s(:statistic) }, values: @stats.values }
  end

  def by_month_of_year
    range = (Time.zone.now.beginning_of_month - 11.months)..Time.zone.now.end_of_month
    @stats = @company.vacancies.group_by_month(:created_at, Time.zone, range).count
    hash
  end
end
