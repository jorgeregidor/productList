class Admin::ProductsController < Admin::BaseController
  before_action :set_product, only: [:edit, :update, :destroy]

  # GET /
  def index
    @products = Product.order(updated_at: :desc).all.includes(:category,:currency,:supplier)
  end

  # GET admin/products/new
  def new
    @product = Product.new
  end

  # GET admin/products/1/edit
  def edit
  end

  # POST admin/products
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_root_url, notice: 'Product was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT admin/products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_root_url, notice: 'Product was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE admin/products/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_root_url, notice: 'Product was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :category_id, :price, :currency_id, :supplier_id)
    end
end
