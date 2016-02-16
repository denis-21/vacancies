class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable

  has_many :vacancies, foreign_key: 'creator_id'
  has_one :company, foreign_key: 'creator_id'
  has_one :profile
  has_many :summaries

  scope :ordered, -> { order(id: :asc) }

  delegate :first_name, :last_name, to: :profile, prefix: false, allow_nil: true
end
