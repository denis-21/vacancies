class Summary < ActiveRecord::Base
  belongs_to :vacancy
  belongs_to :user

  validates :email, :first_name, :last_name, :file, presence: true

  after_create :send_email

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  include AASM
  validates :status, inclusion: { in: %w(received accepted rejected ) }

  aasm column: 'status' do
    state :received, initial: true
    state :accepted
    state :rejected

    event :accept, after: :send_email do
      transitions from: :received, to: :accepted
    end

    event :reject, after: :send_email do
      transitions from: :received, to: :rejected
    end
  end

  def update_status(new_status)
    send("#{new_status}!") if aasm.events.map(&:name).include?(new_status.to_sym)
  end

  def send_email
    SummaryMailer.send((status).to_sym, self, vacancy.creator).deliver_now
  end

  def full_name
    first_name + ' ' + last_name
  end
end
