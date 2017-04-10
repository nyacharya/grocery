class OrderItemsController < ApplicationController
  def create

    
    @order = current_order
    #byebug
    if !OrderItem.where(order_id: OrderItem.last.order.id, product_id: params[:order_item][:product_id].to_i).empty? && @order.id != nil
      @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
      @order_item.update_attributes(order_item_params)
      @order_items = @order.order_items
    else
      @order_item = @order.order_items.new(order_item_params)
      @order.save
      session[:order_id] = @order.id
    end
  end

  def update
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)
    @order_items = @order.order_items
  end

  def destroy
    @order = current_order
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = @order.order_items
  end

private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :user_id)
  end
end
