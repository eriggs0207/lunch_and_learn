class Favorite < ApplicationRecord
  validates_presence_of :country
  validates_presence_of :recipe_title
  validates_presence_of :recipe_link

  belongs_to :user
end
