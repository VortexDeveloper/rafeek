module PagesHelper

  def show_winners(winners)
    if winners.present?
      render partial: 'pages/winners_table', locals: { winners: winners }
    else
      render partial: 'pages/empty_winner_text', locals: { text: "Ops! Ainda não realizamos nenhum sorteio, invista seus pontos em nossas rifas e logo você poderá estar nessa página! :)"}
    end
  end

  def show_raffles(raffles_categories)
    if raffles_categories.present?
      render partial: 'pages/raffles_categories_table', locals: { raffles_categories: raffles_categories }
    else
      render partial: 'pages/empty_winner_text', locals: { text: "Ops! Ainda não temos rifas dessa categoria cadastradas. 'Paciência deve ter você, logo cadastrar mais rifas nós iremos! hummmm... Meditar sobre isso irei.' :)"}
    end
  end

end
