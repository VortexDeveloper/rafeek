FactoryGirl.define do
  factory :account do
    balance Faker::Number.number(3)
    user
  end
end
