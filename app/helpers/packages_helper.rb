module PackagesHelper
  def bandeira_for_select
    options_for_select(bandeiras)
  end

  def bandeiras
    {
      'VISA' => 'visa',
      "MASTERCARD" => 'mastercard',
      'DINERS' => 'diners',
      'DISCOVER' => 'discover',
      'ELO' => 'elo',
      'AMEX' => 'amex',
      'JCB' => 'jcb',
      'AURA' => 'aura'
    }
  end
end
