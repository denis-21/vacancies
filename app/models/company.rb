class Company < ActiveRecord::Base

  after_initialize :find_or_initialize

  validates :name,:link,  presence: true

  has_many :vacancies, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_one :picture, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true, update_only: true

  delegate :image, to: :picture, prefix: false, allow_nil: true

  scope :ordered, -> {order(name: :asc)}

  private

  def find_or_initialize
   self.build_picture unless self.picture
  end  
end
