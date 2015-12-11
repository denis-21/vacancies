class Company < ActiveRecord::Base

  validates :name,:link,  presence: true

  has_many :vacancies, dependent: :destroy
  belongs_to :creator, class_name: 'User'

  scope :ordered, -> {order(name: :asc)}
end
