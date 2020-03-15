class Supplier < ApplicationRecord
  has_many :products

  # must have table called products
  # must have products table have a column called supplier_id
  # column must be an integer
  
  # def products
  #   Product.where(supplier_id: id)
  # end
end
