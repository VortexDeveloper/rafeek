module UserHelper
  def show_performed_transaction(transactions)
    if transactions.present?
      render partial: 'user/transactions_table', locals: { transactions: transactions }
    else
      render text: 'Você ainda não possui transações realizadas!'
    end
  end
end
