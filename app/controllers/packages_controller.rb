class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!, except: [:show]
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.json? }

  layout 'admin', except: [:show, :performed]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
  end

  def purchase
    @transaction = Cielo::Transaction.new
    transaction_parameters = {
      numero: "XXX",
      valor: "10000",
      moeda: "986",
      bandeira: 'visa',
      :"url-retorno" => 'http://localhost:3000',
      cartao_numero: '4012001037141112',
      cartao_validade: '201805',
      cartao_seguranca: '123',
      cartao_portador: 'Lorem Ipsum Dolor'
    }
    tran = @transaction.create!(transaction_parameters, :store)
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Pacote cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Pacote atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    state = ""
    if @package.active?
      @package.inactive!
      state = 'desativado'
    else
      @package.active!
      state = 'ativado'
    end
    respond_to do |format|
      format.html { redirect_to packages_url, notice: "Pacote #{state} com sucesso." }
      format.json { head :no_content }
    end
  end

  def performed
    @performed_transaction = PackageTransaction.find params[:id]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:name, :description, :image, :points, :value, :avatar)
    end

end
