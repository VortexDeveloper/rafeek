require 'rails_helper'

RSpec.describe PackageTransaction, type: :model do
  # describe "#validate_card_number" do
  #   let (:package_transaction) { FactoryGirl.create :transaction }
  #
  #   context "when card number is valid" do
  #     before do
  #       package_transaction.card_data = {
  #         cartao_numero: '4012001037141112',
  #         cartao_validade: '201805',
  #         cartao_seguranca: '123',
  #         cartao_portador: 'Lorem Ipsum Dolor'
  #       }
  #     end
  #
  #     it "returns true" do
  #       expect(package_transaction.validate_card_number).to be true
  #     end
  #   end
  #
  #   context "when card number is invalid" do
  #     before do
  #       package_transaction.card_data = {
  #         cartao_numero: '4012001037141113',
  #         cartao_validade: '201805',
  #         cartao_seguranca: '123',
  #         cartao_portador: 'Lorem Ipsum Dolor'
  #       }
  #     end
  #
  #     it "returns false" do
  #       expect(package_transaction.validate_card_number).to be false
  #     end
  #   end
  # end

  describe "#value" do
    let(:package) { FactoryGirl.create :package }

    context "when there is no discount coupon" do
      let(:package_transaction) { FactoryGirl.create :package_transaction, package: package, coupon: nil }

      it "returns the actual value: package.value*amount" do
        expect(package_transaction.value).to eq(package_transaction.amount * package.value)
      end
    end

    context "when there is a discount coupon" do
      let(:package_transaction) { FactoryGirl.create :package_transaction, package: package }

      it "returns the actual value: package.value*amount" do
        final_value = (package_transaction.amount * package.value) * (1 - package_transaction.coupon.discount.to_f/100)
        expect(package_transaction.value).to eq final_value
      end
    end
  end
end
