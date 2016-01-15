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

  def build_by_periods(params)
    if params[:type_build] == 'period' && params[:start_day].present? && params[:end_day].present?
      summaries.group_by_day(:created_at, range: Time.zone.parse(params[:start_day])..Time.zone.parse(params[:end_day]).end_of_day)
    else
      summaries.group_by_day_of_month(:created_at)
    end
  end

  def build(params)
    @received = build_by_periods(params).received.count
    @accepted = build_by_periods(params).accepted.count
    @rejected = build_by_periods(params).rejected.count
    hash
  end
end
