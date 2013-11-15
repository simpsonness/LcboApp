require 'open-uri'
require './lib/lcbo/lcbo.rb'

class ProductsController < ApplicationController

  def index
    @products = API.get_products
  end

  def show
    id = params[:id]
    @products = API.get_products
    # products = JSON.parse(products_json)
    @products['result'].each do |product|
    @product=product if product['id'].to_i==id.to_i
    end
  end

  def expensive_price
    @products = API.get_most_expensive['result']
    @products_name_price = {}
    @products.each do |item|
      @products_name_price[item['name']] = item['price_in_cents']
    end
  end

  def discontinued_product
    @products = API.discontinued
    @discontinued_product_name = []
    @products['result'].each do |item|
      @discontinued_product_name<<item['name']
    end
  end

end

