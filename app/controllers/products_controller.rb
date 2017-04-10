class ProductsController < ApplicationController
  before_action :check_availability

  def check_availability
    Product.all.each do |prod|
      if prod.avialable_quantity.to_i < 1 
        prod.update_attributes(active: false)
      end
    end  
  end
  def error
    redirect_to root_path
  end
  def index
  	@products = Product.all
    @order_item = current_order.order_items.new
  end

  def new
    authorize! :manage, :all
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
     authorize! :manage, :all
    @product = Product.find(params[:id])
  end

  def success
    @product=OrderItem.where(order_id: params[:id])
    @product.each do |prod|
      quan=prod.product.avialable_quantity.to_i-prod.quantity
      if quan < 0
        flash[:notice] = "Insufficient Stock"
        break
      end
      prod.product.update_attributes(avialable_quantity: quan)  
      prod.update_attributes(status: "Purchased")
    end
    session[:order_id]=nil
    redirect_to root_path
  end

  def show_all_products
    authorize! :manage, :all
    @all_products=Product.all
  end

  def show
  	@product=Product.where(id: params[:id])
    @order_item = current_order.order_items.new
  end

  def showproducts
    @product=Product.where(category_id: params[:id])
    @order_item = current_order.order_items.new
  end
  # POST /products
  # POST /products.json
  def create
    authorize! :manage, :all
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product detail was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    authorize! :manage, :all
    respond_to do |format|
  
      @product = Product.find(params[:id])
      if @product.update(product_params)

        format.html { redirect_to @product, notice: 'Product detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    byebug
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def product_params
      params.require(:product).permit(:category_id, :name, :seller, :best_before_date, 
        :manufacture_date, :details, :brand, :status, :image,
        :price, :avialable_quantity, :discount, :product_code)
    end
end
