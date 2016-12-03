class UserMailer < ApplicationMailer
  def authorized_purchase_mail(package_transaction)
    return nil if package_transaction.nil? || !package_transaction.authorized?
    mail_data(package_transaction, "autorizada")
  end

  def canceled_purchase_mail(package_transaction)
    return nil if package_transaction.nil? || !package_transaction.canceled?
    mail_data(package_transaction, "cancelada")
  end

  def authenticated_purchase_mail(package_transaction)
    return nil if package_transaction.nil? || !package_transaction.authenticated?
    mail_data(package_transaction, "autenticada")
  end

  def captured_purchase_mail(package_transaction)
    return nil if package_transaction.nil? || !package_transaction.captured?
    mail_data(package_transaction, "efetuada com sucesso")
  end

  def mail_data(package_transaction, status)
    @package_transaction = package_transaction
    @profile = @package_transaction.user.profile
    mail(
      to: "#{@profile.name} <#{@package_transaction.user.email}>",
      subject: "Sua compra foi #{status}!"
    )
  end

  def be_partner_mail(data)
    @data = data
    mail(
      to: "Rafeek Contato <contato@rafeek.com.br>",
      subject: "A empresa #{data[:company]} quer ser parceira!"
    )
  end
end
