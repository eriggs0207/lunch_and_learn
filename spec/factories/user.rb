FactoryBot.define do
  factory :user do
    name {Faker::Movies::StarWars.character}
    email {Faker::Internet.email}
  end

  factory :favorite, class: Favorite do
    country       {Faker::Address.country}
    recipe_title {Faker::Food.dish}
    recipe_link  {Faker::Number.within(range: 500..2000)}
    association :user, factory: :user
  end
end
