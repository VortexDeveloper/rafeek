FactoryGirl.define do
  factory :ticket do
    raffle
    owner user
  end
end
