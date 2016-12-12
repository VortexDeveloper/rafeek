class PagesController < ApplicationController

  layout 'home', except: [:terms, :raffles, :packages, :raffles_new, :raffles_hot, :winners, :help, :raffles_categories]

  def index
    @raffles_index = Raffle.presentation.order('created_at DESC limit 8')
    @partners = Partner.all
    @winners = self.winners
    @packages = Package.all
  end

  def terms
  end

  #helper_method :sort_column, :sort_direction

  def raffles
    @raffles = Raffle.presentation.search(params[:search]).paginate(page: params[:page], per_page: 12)
    @pagination_data = {search: params[:search].present?, page: params[:page]}

    respond_to do |format|
      format.html
      format.js
    end
  end

  def packages
    @packages = Package.where(active: 1)
  end

  def raffles_new
    @raffles_new = Raffle.new_raffles.paginate(page: params[:page], per_page: 12)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def raffles_hot
    @raffles_hot = Raffle.hot(params[:page])
    respond_to do |format|
      format.html
      format.js
    end
  end

  def winners
    @winners = Raffle.presentation.where("winner_ticket_id IS NOT NULL").order(deadline: :desc)
  end

  def raffles_categories
    category = Category.find params[:category_id]
    @page_title = category.name
    related_categories = all_related_categories(category)
    @raffles_categories = Raffle.presentation.where(category: related_categories).paginate(page: params[:page], per_page: 12)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def help
  end

  def send_partner_email
    UserMailer.be_partner_mail(params).deliver
    redirect_to root_path
  end

  def send_contact_email
    UserMailer.contact_mail(params).deliver
    redirect_to request.referrer
  end

  private
  def all_related_categories(c)
    categories = []
    childz = []
    childz << c

    while childz.size > 0 do
    	first = childz.shift
    	first.childs.each { |d| childz << d }
    	categories << first.id
    end

    categories
  end

end
