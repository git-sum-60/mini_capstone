Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/the_product" => "products#single_product"
    get "/second_product" => "products#second"
    get "/every_product" => "products#all"
    get "/dynamic_product_query" => "products#show"
    get "/products/:id" => "products#show"
  end
end
