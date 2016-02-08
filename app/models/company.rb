class Company < ActiveRecord::Base
  validates :name, :link, presence: true

  after_create :send_email

  has_many :vacancies, dependent: :destroy
  belongs_to :creator, class_name: 'User'
  has_one :picture, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true, update_only: true

  delegate :image, to: :picture, prefix: false, allow_nil: true

  scope :ordered, -> { order(name: :asc) }

  include AASM
  validates :status, inclusion: { in: %w(disable active reject) }

  aasm column: 'status' do
    state :disable, initial: true
    state :active
    state :reject

    event :activate, after: :send_email do
      transitions from: :disable, to: :active
    end
    event :rejected, after: :send_email do
      transitions from: [:disable, :active], to: :reject
    end
  end

  def send_email
    CompanyMailer.send((status).to_sym, self).deliver_now
  end
end
