FactoryGirl.define do
  factory :package_transaction do
    amount Faker::Number.number 1
    status 1
    user
    package
    coupon
  end
end
