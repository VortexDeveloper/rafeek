require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:user) { FactoryGirl.create :user }
  let!(:account) { FactoryGirl.create :account, user: user }

  describe ".extract" do
    it "should subtract points from balance" do
      original_points = account.balance
      points = Faker::Number.number(2).to_i
      expect{account.extract(points)}.to change{
        account.balance
      }.from(original_points).to(original_points-points)
    end
  end
end
