class Vacancy < ActiveRecord::Base
  validates :title, :description, :city, :country, :deadline, presence: true

  belongs_to :company
  belongs_to :creator, class_name: 'User'
  has_many :summaries, dependent: :destroy

  scope :ordered, -> { order(id: :desc) }
  scope :search_by, (lambda do |key, value|
    where(key => value) if attribute_names.include?(key.to_s)
  end)
  scope :active, -> { where('deadline >= ?', Time.zone.today) }

  def status
    deadline < Time.zone.today ? 'stale' : 'live'
  end
end
