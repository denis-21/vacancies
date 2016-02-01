class Vacancy < ActiveRecord::Base
  validates :title, :description, :city, :country, :continent, :deadline, presence: true

  belongs_to :company
  belongs_to :creator, class_name: 'User'
  has_many :summaries, dependent: :destroy

  scope :ordered, -> { order(id: :desc) }
  scope :search_by, (lambda do |key, value|
    where(key => value) if attribute_names.include?(key.to_s)
  end)
  scope :active, -> { where('deadline >= ?', Time.zone.today) }

  scope :company_name, lambda {
    joins('LEFT JOIN companies ON companies.id = vacancies.company_id')
      .select('vacancies.*, companies.name as company_name')
      .group('companies.id')
  }

  scope :summaries_received_states, lambda {
    joins("LEFT JOIN summaries as summaries ON summaries.vacancy_id = vacancies.id AND summaries.status = 'received'")
      .select('COUNT(summaries.status) as received_st')
      .group('vacancies.id')
  }

  def status
    deadline < Time.zone.today ? 'stale' : 'live'
  end
end
