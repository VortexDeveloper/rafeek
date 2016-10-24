require 'rails_helper'

RSpec.describe PackageTransactionController, type: :controller do
  let(:user) { FactoryGirl.create :user, group: 0 }
  let(:package) { FactoryGirl.create :package }
  let(:purchase_params) do
    {
      amount: Faker::Number.number(1),
      package_id: package.id,
      moeda: "986",
      bandeira: 'visa',
      cartao_numero: '4012001037141112',
      cartao_validade: '201805',
      cartao_seguranca: '123',
      cartao_portador: 'Lorem Ipsum Dolor'
    }
  end

  describe "POST #purchase" do
    before do
      sign_in user
      allow_any_instance_of(PackageTransaction).to receive(:make_transaction).and_return(root_path)
    end

    it "returns http success" do
      post :purchase
      expect(response).to have_http_status(:success)
    end

    it "should create a Package Transaction object" do
      post :purchase, params: purchase_params
      expect(assigns(:transaction)).to be_kind_of PackageTransaction
    end

    it "should send make_transaction to the PackageTransaction object" do
      expect_any_instance_of(PackageTransaction).to receive(:make_transaction)
      post :purchase, params: purchase_params
    end

    it "redirect to the make_transaction return value" do
      post :purchase, params: purchase_params
      expect(controller).to redirect_to root_path
    end
  end

  describe "GET #validate_purchase" do
    before do
      sign_in user
      post :purchase, params: purchase_params
    end

    it "find a Package Transaction object" do
      package_transaction = PackageTransaction.order("created_at").last
      get :validate_purchase, params: {id: package_transaction.id}
      expect(assigns(:transaction)).to be_kind_of PackageTransaction
    end

    context "if status == :captured after verify!" do
      let(:package_transaction) { package_transaction = PackageTransaction.order("created_at").last }

      it "redirect to the pages_raffles_path" do
        allow_any_instance_of(Cielo::Transaction).to receive(:verify!)
        .with(package_transaction.tid).and_return({
          :transacao=> {
            :status=>"6"
          }
        })

        get :validate_purchase, params: {id: package_transaction.id}
        expect(controller).to redirect_to pages_raffles_path
      end
    end

    context "if status != :captured after verify!" do
      let(:package_transaction) { package_transaction = PackageTransaction.order("created_at").last }

      it "redirect to the pages_packages_path" do
        allow_any_instance_of(Cielo::Transaction).to receive(:verify!)
        .with(package_transaction.tid).and_return({
          :transacao=> {
            :status=>"5"
          }
        })

        get :validate_purchase, params: {id: package_transaction.id}
        expect(controller).to redirect_to pages_packages_path
      end
    end
  end
end
