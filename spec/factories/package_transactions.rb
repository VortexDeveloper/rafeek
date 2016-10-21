FactoryGirl.define do
  factory :package_transaction do
    amount 1
    user
    status 1
    package
    tid "123456"
  end
end
