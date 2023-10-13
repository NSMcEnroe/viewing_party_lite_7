# frozen_string_literal: true

FactoryBot.define do
  factory :viewing_party do
    start_time { Faker::Time.between(from: DateTime.now, to: 30.days.from_now) }
    duration { Faker::Number.between(from: 1, to: 300) }
    movie_id { Faker::Number.between(from: 1, to: 1000) }
  end
end
