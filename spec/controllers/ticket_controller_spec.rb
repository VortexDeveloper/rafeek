require 'rails_helper'

RSpec.describe TicketController, type: :controller do
  describe "POST purchase" do
    let(:user) { FactoryGirl.create :user }
    let(:raffle) { FactoryGirl.create :raffle }
    let(:account) { FactoryGirl.create :account, user: user }

    before do
      sign_in user
    end

    it "should assign a purchase object" do
      post 'purchase', {amount: 3, raffle_id: raffle.id}
      expect(assigns(:purchase)).to be_a_new(Hash).with(
        amount: post[:amount]
      )
    end

    context "when user has suficient points" do
      xit "should take difference in user account balance" do
        #expect(post).to send(:)
      end

      xit "should update :purchase_status of the tickets to :complete" do
        # post purchase_path, amount: 3, raffle: raffle
        # expect(controller).to
      end
    end

    context "when user hasn't suficient points" do
      before :each do
        user.account.balance = 0
      end

      xit "should update :purchase_status of the tickets to :pending" do
        # post purchase_path, amount: 3, raffle: raffle
        # expect()
      end

      it "should redirect to packges_path" do
        post ticket_purchase_path, amount: 3, raffle: raffle
        expect(controller).to redirect_to packages_path
      end
    end
  end
end
