class VacanciesReportBuilder
  def initialize(vacancy)
    @vacancy = vacancy
  end

  def summaries
    @vacancy.summaries
  end

  def hash
    { labels: @received.keys.map { |dt| dt.to_s(:human) }, values: { received: @received.values, accepted: @accepted.values, rejected: @rejected.values } }
  end

  def build_by_periods(start_day, end_day)
    if start_day.present? && end_day.present?
      by_day(start_day, end_day)
    else
      by_day_of_month
    end
  end

  def by_day(start_day, end_day)
    summaries.group_by_day(:created_at, range: Time.zone.parse(start_day)..Time.zone.parse(end_day).end_of_day)
  end

  def by_day_of_month
    summaries.group_by_day_of_month(:created_at)
  end

  def build(start_day, end_day)
    type_report = build_by_periods(start_day, end_day)
    @received = type_report.received.count
    @accepted = type_report.accepted.count
    @rejected = type_report.rejected.count
    hash
  end
end
