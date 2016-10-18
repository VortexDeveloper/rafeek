require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe ".create!" do
    let(:raffle) { FactoryGirl.create(:raffle) }
    let(:user) { FactoryGirl.create :user }
    let!(:account) { FactoryGirl.create :account }

    context "When amount <= 0" do
      let(:ticket_transaction) {
        FactoryGirl.create :ticket_transaction, amount: 0, user: user
      }

      it "should raise a RuntimeError" do
        expect{Ticket.create!(ticket_transaction, raffle)}.to raise_error(RuntimeError)
      end
    end

    context "When amount > 0" do
      let(:ticket_transaction) {
        FactoryGirl.create :ticket_transaction, user: user
      }

      it "should create amount tickets in database with transaction" do
        Ticket.create!(ticket_transaction, raffle)
        expect(Ticket.count).to eq ticket_transaction.amount.to_i
      end
    end
  end
end
