FactoryGirl.define do 
  factory :user do |f|
    f.sequence(:email) { |n| "test#{n}@example.com" }
    group 1
    password Faker::Number.number(6)
  end
end
