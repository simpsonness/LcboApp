class API
  require 'open-uri'
  
  def self.get_products
    products_json = open("http://lcboapi.com/products").read
    JSON.parse(products_json)
  end

  def self.get_most_expensive
    products_json = open("http://lcboapi.com/products?order=price_in_cents.desc").read
    JSON.parse(products_json)

  end

  def self.discontinued
    products_json = open("http://lcboapi.com/products?where=is_discontinued").read
    JSON.parse(products_json)
  end

  # end

  # def self.get_most_expensive_beers
  # end
end

# http://lcboapi.com/products?where=is_discontinued