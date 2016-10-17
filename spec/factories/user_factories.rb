FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    group 1
    password Faker::Number.number(6)
  end
end
