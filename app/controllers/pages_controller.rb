class PagesController < ApplicationController

  layout 'home', except: [:raffles, :packages]

  def index
    @raffles = Raffle.all
    @partners = Partner.all
  end

  def raffles
    @raffles = Raffle.all
  end

  def packages
    @packages = Package.all
  end

  def raffles_new
  end

  def raffles_hot
  end

  def winners
  end

  def help    
  end

end
