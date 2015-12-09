class Company < ActiveRecord::Base

  validates :name,:link,  presence: true

  has_many :vacancies, dependent: :destroy

  scope :ordered, -> {order(name: :asc)}
end

