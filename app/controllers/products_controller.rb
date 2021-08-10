class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy delete ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
    @keywords = Keyword.all
  end

  # GET /products/new
  def new
    @keywords = Keyword.all
    @stores = Store.all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @keywords = Keyword.all
    @stores = Store.all
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    if params[:product][:store_ids].present?
      params[:product][:store_ids].each do |store_id|
        unless store_id.empty?
          store = Store.find(store_id)
          @product.stores << store
        end
      end
    end

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    stores = []
    if params[:product][:store_ids].present?
      params[:product][:store_ids].each do |store_id|
        unless store_id.empty?
          store = Store.find(store_id)
          stores << store
        end
      end
    end

    unless stores.empty?
      @product.stores = stores
    else
      @product.stores.clear
    end
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @erased = true
    respond_to do |format|
      format.js
    end
  end

  def delete
      @product.destroy
      redirect_to products_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :color, :size, :price, :category_id)
    end
end
