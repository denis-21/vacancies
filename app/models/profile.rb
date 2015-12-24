class Profile < ActiveRecord::Base
  include CleanData

  belongs_to :user
  has_one :picture, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :picture, allow_destroy: true, update_only: true
  delegate :image, to: :picture, prefix: false, allow_nil: true

  def default_image
    'http://placehold.it/300x300&text=Avatar'
  end
end
