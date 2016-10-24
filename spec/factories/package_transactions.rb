FactoryGirl.define do
  factory :package_transaction do
    amount 1
    status 1
    user
    package
  end
end
