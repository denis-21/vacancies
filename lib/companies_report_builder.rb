class CompaniesReportBuilder
  def initialize(company)
    @company = company
  end

  def hash
    { labels: @stats.keys.map { |dt| dt.to_s(:human) }, values: @stats.values }
  end

  def build_by_periods(start_day, end_day)
    if start_day.present? && end_day.present?
      by_day(start_day, end_day)
    else
      by_month_of_year
    end
  end

  def by_month_of_year
    range = (Time.zone.now.beginning_of_month - 11.months)..Time.zone.now.end_of_month
    @company.vacancies.group_by_month(:created_at, Time.zone, range).count
  end

  def by_day(start_day, end_day)
    range = Time.zone.parse(start_day)..Time.zone.parse(end_day).end_of_day
    @company.vacancies.group_by_day(:created_at, range: range).count
  end

  def build(start_day = nil, end_day = nil)
    @stats = build_by_periods(start_day, end_day)
    hash
  end
end
