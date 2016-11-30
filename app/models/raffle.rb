class Raffle < ApplicationRecord
  has_many :tickets
  belongs_to :category
  belongs_to :winner_ticket, class_name: 'Ticket', optional: true

  has_attached_file(
    :avatar,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: "/images/:style/missing.png"
  )

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def amount_sold
    tickets.count
  end

  def tickets_available
    amount - amount_sold
  end

  def random_select
    winner_ticket = tickets.sample
    update_attributes winner_ticket_id: winner_ticket.id

    winner_ticket
  end

  def winner
    winner_ticket.owner
  end

  def participants
    tickets.group(:owner_id).collect { |ticket| ticket.owner }
  end

  def all_sold?
    amount_sold == amount
  end

  def payback
    transactions.each { |t| t.payback }
  end

  def transactions
    transactions = []
    tickets.group(:ticket_transaction_id, :id).each do |t|
      transactions << t.ticket_transaction
    end
    transactions
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end
end
