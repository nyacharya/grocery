class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @categories = Category.all
    
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
    respond_with(@category)
  end

  def edit
  end

  def testing
    
  end

  def buy
    redirect_to new_charge_path
     # OrderItem.where(order_id: params[:id]).each do |prod|
     # prod.update_attribute :status, "Pdd"
     # end
     # session[:order_id]=nil
     # redirect_to root_path
  end

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :detail)
    end
end
