class Category < ApplicationRecord
  has_many :category_products
  has_many :products, through: :category_products
end




# lightsaber -- electronics
# lightsaber -- kitchen

# dice set -- games
# space cowboy laser gun -- electronics
