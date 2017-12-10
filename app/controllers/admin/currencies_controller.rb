class Admin::CurrenciesController < Admin::BaseController
  before_action :set_currency, only: [:show, :edit, :update, :destroy]

  # GET admin/currencies
  def index
    @currencies = Currency.all
  end

  # GET admin/currencies/1
  def show
  end

  # GET admin/currencies/new
  def new
    @currency = Currency.new
  end

  # GET admin/currencies/1/edit
  def edit
  end

  # POST admin/currencies
  def create
    @currency = Currency.new(currency_params)

    respond_to do |format|
      if @currency.save
        format.html { redirect_to [:admin,@currency], notice: 'Currency was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT admin/currencies/1
  def update
    respond_to do |format|
      if @currency.update(currency_params)
        format.html { redirect_to [:admin, @currency], notice: 'Currency was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE admin/currencies/1
  def destroy
    @currency.destroy
    respond_to do |format|
      format.html { redirect_to admin_currencies_url, notice: 'Currency was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_currency
      @currency = Currency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def currency_params
      params.require(:currency).permit(:name, :code)
    end
end
