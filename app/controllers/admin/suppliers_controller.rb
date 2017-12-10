class Admin::SuppliersController < Admin::BaseController
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]

  # GET admin/suppliers
  def index
    @suppliers = Supplier.all
  end

  # GET admin/suppliers/1
  def show
  end

  # GET admin/suppliers/new
  def new
    @supplier = Supplier.new
  end

  # GET admin/suppliers/1/edit
  def edit
  end

  # POST admin/suppliers
  def create
    @supplier = Supplier.new(supplier_params)
    respond_to do |format|
      if @supplier.save
        format.html { redirect_to [:admin, @supplier], notice: 'Supplier was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT admin/suppliers/1
  def update
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to [:admin, @supplier], notice: 'Supplier was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE admin/suppliers/1
  def destroy
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to admin_suppliers_url, notice: 'Supplier was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplier_params
      params.require(:supplier).permit(:name)
    end
end
