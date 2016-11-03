FactoryGirl.define do
  factory :coupon do
    name Faker::Company.name
    code Faker::Name.first_name
    validity Faker::Date.forward
    discount Faker::Number.between(0, 100)
  end
end
