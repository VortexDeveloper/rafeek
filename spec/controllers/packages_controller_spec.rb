require 'rails_helper'

RSpec.describe PackagesController, type: :controller do
  let(:user) { FactoryGirl.create :user, group: 0 }

  before do
    sign_in user
  end

  describe 'POST purchase' do
    it 'should create a Cielo Transaction object' do
      post :purchase, params: {}
      expect(assigns(:transaction)).to be_kind_of Cielo::Transaction
    end
  end
end
