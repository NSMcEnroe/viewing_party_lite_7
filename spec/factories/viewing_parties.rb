FactoryBot.define do
  factory :user do
    start_time { Faker::Time.datetime }
    duration { Faker::Number.between(from: 1, to: 300) }
  end
end