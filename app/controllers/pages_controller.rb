class PagesController < ApplicationController

  layout 'home', except: [:terms, :raffles, :packages, :raffles_new, :raffles_hot, :winners, :help, :raffles_categories]

  def index
    @raffles = Raffle.all.order('created_at DESC limit 8')
    @partners = Partner.all
    @winners = self.winners
  end

  def terms
  end

  #helper_method :sort_column, :sort_direction

  def raffles
    #@raffles = Raffle.all
    @raffles = Raffle.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
  end

  def packages
    @packages = Package.all
  end

  def raffles_new
    @raffles_new = Raffle.where(
      'created_at >= :five_days_ago',
      :five_days_ago  => Time.now - 7.days
    )
  end

  def raffles_hot
    @raffles_hot = Raffle.all.order(points: :desc)
  end

  def winners
    Raffle.where("winner_ticket_id IS NOT NULL").order(deadline: :desc)
  end

  def raffles_categories
    @page_title = params[:category]
    @raffles_categories = Raffle.where("category LIKE ?", params[:category])
  end

  def help
  end

end
