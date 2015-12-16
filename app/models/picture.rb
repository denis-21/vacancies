class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://placehold.it/100x100&text=Logo"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
