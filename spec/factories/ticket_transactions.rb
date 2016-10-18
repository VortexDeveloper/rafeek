FactoryGirl.define do
  factory :ticket_transaction do
    amount Faker::Number.number(1)
    user
    status :pending
  end
end
