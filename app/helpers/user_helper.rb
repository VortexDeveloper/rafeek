module UserHelper
  def show_performed_transaction(transactions)
    if transactions.present?
      render partial: 'user/transactions_table', locals: { transactions: transactions }
    else
      render partial: 'user/empty_table_text', locals: { text: "Você ainda não possui transações realizadas!"}
    end
  end
  def show_points(tickets_transactions)
    if tickets_transactions.present?
      render partial: 'user/points_table', locals: { tickets_transactions: tickets_transactions }
    else
      render partial: 'user/empty_table_text', locals: { text: "Você ainda não possui pontos!"}
    end
  end
  def show_tickets(tickets)
    if tickets.present?
      render partial: 'user/tickets_table', locals: { tickets: tickets }
    else
      render partial: 'user/empty_table_text', locals: { text: "Você ainda possui nenhuma rifa!"}
    end
  end


end
