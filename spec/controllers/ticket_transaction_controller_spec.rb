require 'rails_helper'

RSpec.describe TicketTransactionController, type: :controller do

  describe "POST #purchase" do
    let(:user) { FactoryGirl.create :user }
    let(:raffle) { FactoryGirl.create :raffle }
    let!(:account) { FactoryGirl.create :account, user: user }
    let(:params) { {amount: 3, raffle_id: raffle.id} }

    before do
      sign_in user
    end

    it "should assign a TicketTransaction object" do
      post 'purchase', params: params
      expect(assigns(:transaction)).to be_kind_of(TicketTransaction)
    end

    context "when user has suficient points" do
      let(:needed_points) { (params[:amount].to_i)*raffle.points }

      before do
        account.balance = needed_points+10
        account.save!
      end

      it 'should send message to Account#extract' do
        expect_any_instance_of(Account).to receive(:extract).with needed_points
        post 'purchase', params: params
      end

      it "should redirect to root_path" do
        post 'purchase', params: params
        expect(controller).to redirect_to root_path
      end
    end

    context "when user hasn't suficient points" do
      before do
        account.balance = 0
        account.save!
      end

      it "should redirect to packges_path" do
        post 'purchase', params: params
        expect(controller).to redirect_to packages_path
      end
    end
  end
end
