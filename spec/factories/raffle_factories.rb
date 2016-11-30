FactoryGirl.define do
  factory :raffle do
    title Faker::Name.title
    description Faker::Lorem.paragraph
    points Faker::Number.number(3)
    amount Faker::Number.number(3)
    category
  end
end
