FactoryBot.define do
  factory :movie do
    original_title { Faker::Movie.title }
    vote_average { Faker::Number.between(from: 1, to: 10) }
    movie_id { Faker::Number.between(from: 1, to: 10000) }
  end
end