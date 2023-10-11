FactoryBot.define do
  factory :viewing_party do
    start_time { Faker::Time.datetime }
    duration { Faker::Number.between(from: 1, to: 300) }
  end
end