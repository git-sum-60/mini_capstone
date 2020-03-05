class Api::ProductsController < ApplicationController
  def single_product
    @product = Product.find_by(id: 3)
    render 'one_product.json.jb'
  end

  def second
    @product = Product.find_by(id: 2)
    render 'second_one.json.jb'
  end

  def all
    @products = Product.all
    render 'every.json.jb'
  end

  def query
    # take user params
    # find the value
    # look for that value in the db
    the_id = params[:product]
    # find the correct product
    @product = Product.find_by(id: the_id)
    # show that product to the user
    render 'query.json.jb'
  end
end
