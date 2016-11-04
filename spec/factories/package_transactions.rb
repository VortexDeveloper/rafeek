FactoryGirl.define do
  factory :package_transaction do
    amount Faker::Number.number 1
    status "created"
    user
    package
    coupon
  end
end
