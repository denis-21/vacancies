class ExternalClient < ActiveRecord::Base
  validates :name, presence: true

  after_create :generate_secret_key

  private

  def generate_secret_key
    update_attributes(secret_key: Digest::SHA1.hexdigest(id.to_s + name + created_at.to_s))
  end
end
