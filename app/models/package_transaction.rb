class PackageTransaction < ApplicationRecord
  include CieloCreditable

  belongs_to :user
  belongs_to :package
  belongs_to :coupon, optional: true

  attr_accessor :card_data, :url_retorno

  def make_transaction
    if validate_card_number
      transaction = initialize_transaction(prepare_params)
      logger.debug transaction
      raise unless transaction[:transacao].present?
      update_attributes(tid: transaction[:transacao][:tid])
      transaction[:transacao][:"url-autenticacao"]
    end
  end

  def verify_status(cielo_transaction)
    update_status(cielo_transaction)
    assign_points if captured? || canceled?
    send_mail
    raise unless captured? || canceled?
  end

  private
  def prepare_params
    {
      numero: package.id,
      valor: cielo_value,
      :"url-retorno" => url_retorno
    }.merge(prepare_cielo_params)
  end

  def assign_points
    user.account.credit(package.points * amount)
  end

  def apply_discounts(final_value)
    return final_value unless coupon.present?
    multiplier = (1 - coupon.discount.to_f/100)
    final_value*multiplier
  end

  def send_mail
    case status
      when 'captured'
        UserMailer.captured_purchase_mail(self).deliver_now
      when 'canceled'
        UserMailer.canceled_purchase_mail(self).deliver_now
      when 'authenticated'
        UserMailer.authenticated_purchase_mail(self).deliver_now
      when 'authorized'
        UserMailer.authorized_purchase_mail(self).deliver_now
      else
        logger.info 'Nenhum email enviado'
    end
  end
end
