class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:lockable

  has_many :vacancies, :foreign_key => 'creator_id'
  has_many :companies, :foreign_key => 'creator_id'
  has_one :profile

  scope :ordered, -> {order(id: :asc)}
end
