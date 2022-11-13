class User < ApplicationRecord
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true

  has_secure_token :api_key

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(10)
  end
end
