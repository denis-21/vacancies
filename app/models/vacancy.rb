class Vacancy < ActiveRecord::Base

  validates :title,:description,:city, :country,:deadline, presence: true

  belongs_to :company


  scope :ordered, -> {order(id: :desc)}
  scope :search_country, ->(country) { where(country: country ) }
  scope :search_city, ->(city) { where(city: city ) }
  scope :search_company, ->(company_id) { where(company_id: company_id ) }
  scope :active, -> { where("deadline >= ?", Date.today) }


  def status
    deadline < Date.today ? 'stale' : 'live'
  end
end
