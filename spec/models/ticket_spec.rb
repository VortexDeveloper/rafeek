require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe ".create!" do
    let(:raffle) { FactoryGirl.create(:raffle) }
    let(:user) { FactoryGirl.create :user }

    it "params should have amount > 0" do
      params = {amount: 0, raffle: raffle}
      expect{Ticket.create!(user, params)}.to raise_error(RuntimeError)
    end

    it "should create amount tickets in database with transaction" do
      params = { amount: Faker::Number.number(1), raffle: raffle }
      Ticket.create!(user, params)
      expect(Ticket.count).to be params[:amount].to_i
    end
  end
end
