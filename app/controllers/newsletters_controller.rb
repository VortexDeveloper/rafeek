class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  # GET /newsletters
  # GET /newsletters.json
  def index
    @newsletters = Newsletter.all
  end

  # POST /newsletters
  # POST /newsletters.json
  def create
    @newsletter = Newsletter.create do |n|
      n.email = params[:email]
    end
    redirect_to root_path, :flash => { :success => "Email cadastrado com sucesso" }
  end


  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def newsletter_params
      params.require(:newsletter).permit(:email)
    end
end
