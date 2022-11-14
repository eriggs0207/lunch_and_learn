class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :country, :recipe_title, :recipe_link
end
