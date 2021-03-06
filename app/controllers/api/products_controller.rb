class Api::ProductsController < ApplicationController
  before_action :authenticate_admin, only: [:create, :update, :destroy]
  
  def index
    # @products = Product.where('name LIKE ?', "%#{params[:search]}%")

    # if params[:discount] == 'true'
    #   @products = @products.where("price < 10")
    # end

    # if params[:sort] && params[:sort_order]
    #   @products = @products.order(params[:sort] => params[:sort_order])
    # else
    #   @products = @products.order(:id)
    # end

    category = Category.find_by(name: params[:search])
    
    @products = category.products

    render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: params[:supplier_id]
    )

    if @product.save      
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    # if @product.update(
    #     name: params[:name] || @product.name,
    #     price: params[:price] || @product.price,
    #     description: params[:description] || @product.description,
    #     image_url: params[:image_url] || @product.image_url
    #   )
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url

    if @product.save
      render 'show.json.jb'
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
      
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json: {message: "Product has been removed"}
  end

  
end



# high level

# add validations in model
# test in rails console with .save, .errors.full_messages
# add happy sad paths in controller