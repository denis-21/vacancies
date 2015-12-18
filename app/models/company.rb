class Company < ActiveRecord::Base
  validates :name, :link, presence: true

  has_many :vacancies, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_one :picture, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true, update_only: true

  delegate :image, to: :picture, prefix: false, allow_nil: true

  scope :ordered, -> { order(name: :asc) }
end
