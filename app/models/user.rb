class User < ApplicationRecord
  validates_presense_of :name
  validates :email, uniqueness: true, presence: true
  
end
