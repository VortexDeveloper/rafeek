class PagesController < ApplicationController

  layout 'home', except: [:raffles, :packages, :raffles_new, :raffles_hot, :winners, :help, :raffles_categories]

  def index
    @raffles = Raffle.all.order('created_at DESC')
    @partners = Partner.all
  end

  def raffles
    @raffles = Raffle.all
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
    #@raffles_hot = Raffle.where("", )
  end

  def winners
  end

  def raffles_categories
    @page_title = params[:category]
    @raffles_categories = Raffle.where("category LIKE ?", params[:category])
  end

  def help
  end

end
