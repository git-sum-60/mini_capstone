class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @orders = current_user.orders
    render "index.json.jb"    
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end
  
  def create
    @carted_products = current_user.carted_products.where(status: 'carted')

    subtotal = 0
    @carted_products.each do |carted_product|
      subtotal += carted_product.product.price * carted_product.quantity
    end
    
    tax_rate = 0.09
    tax = subtotal * tax_rate
    total = subtotal + tax
    

    @order = Order.new(
      user_id: current_user.id,
      subtotal: subtotal,
      tax: tax,
      total: total
    )

    @order.save
    
    render "show.json.jb"
  end
end
