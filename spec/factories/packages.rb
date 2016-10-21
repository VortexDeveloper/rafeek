FactoryGirl.define do
  factory :package do |f|
    name Faker::Name.name
    description Faker::Lorem.sentence
    points Faker::Number.number 3
    value Faker::Number.number 2
  end
end
