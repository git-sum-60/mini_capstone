class Api::OrdersController < ApplicationController
  def create
    product = Product.find_by(id: params[:product_id])
    the_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.09
    tax = the_subtotal * tax_rate
    total = the_subtotal + tax
    
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: the_subtotal,
      tax: tax,
      total: total
    )

    
    @order.save
    render "show.json.jb"
  end
end
