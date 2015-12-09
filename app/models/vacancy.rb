class Vacancy < ActiveRecord::Base

  validates :title,:description,:city, :country,:deadline, presence: true

  belongs_to :company

  scope :ordered, -> {order(id: :desc)}
  scope :search_by, ->(key,value) { where(key.to_sym =>value)}
  scope :active, -> { where("deadline >= ?", Date.today) }

  def status
    deadline < Date.today ? 'stale' : 'live'
  end
end

