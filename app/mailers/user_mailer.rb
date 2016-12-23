class UserMailer < ApplicationMailer
  def created_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "iniciada")
  end

  def authorized_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "autorizada")
  end

  def not_authorized_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "não autorizada")
  end

  def canceled_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "cancelada")
  end

  def authenticated_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "autenticada")
  end

  def captured_purchase_mail(package_transaction)
    return nil if package_transaction.nil?
    mail_data(package_transaction, "efetuada com sucesso")
  end

  def mail_data(package_transaction, status)
    sendgrid_category 'Transactions'
    @package_transaction = package_transaction
    @profile = @package_transaction.user.profile
    mail(
      to: "#{@profile.name} <#{@package_transaction.user.email}>",
      subject: "Sua compra foi #{status}!"
    )
  end

  def be_partner_mail(data)
    sendgrid_category 'Partners'
    @data = data
    mail(
      to: "Rafeek Parceria <suporte@vortexdeveloper.com>",
      subject: "A empresa #{data[:company]} quer ser parceira!"
    )
  end

  def contact_mail(data)
    sendgrid_category 'Contact'
    @data = data
    mail(
      to: "Rafeek Contato <suporte@vortexdeveloper.com>",
      subject: "Um novo contato feito pelo site!"
    )
  end
end
