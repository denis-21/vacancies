class Summary < ActiveRecord::Base
  belongs_to :vacancy

  validates :email, :first_name, :last_name, :file, presence: true

  has_attached_file :file
  validates_attachment :file, content_type: { content_type: %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

  include AASM
  validates :status,
            inclusion: { in: %w(received  accepted rejected ) }

  aasm column: 'status' do
    state :received, initial: true
    state :accepted
    state :rejected

    event :accept do
      transitions from: :new, to: :accepted
    end

    event :reject do
      transitions from: :new, to: :rejected
    end
  end
end
