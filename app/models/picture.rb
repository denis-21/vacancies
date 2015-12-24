class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }, default_url: :default_image
  validates_attachment_content_type :image, content_type: %r{\Aimage\/.*\Z}

  def default_image
    imageable.respond_to?(:default_image) ? imageable.default_image : 'http://placehold.it/50/ffffff/ffffff'
  end
end
