require 'json'
path = File.join(File.dirname(__FILE__), '../data/products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date
time = Time.new

puts "today's date :" + time.inspect

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

brand_list = []
indx = 0
products_hash['items'].each do |_item|
  brand_list.push(_item['brand']) unless brand_list.include? _item['brand']
  indx += 1
  puts " Item " + indx.to_s + " title is : " + _item['title']
  puts " Item " + indx.to_s + " full price : " + _item['full-price']

  puts " totle purchases #{_item['purchases'].length}"

  total_sales = 0
  _item['purchases'].each do |_purchases|
    total_sales += _purchases['price']
  end

  puts " total amount of sales : " + total_sales.to_s
  avg = total_sales.to_f / _item['purchases'].length.to_f
  puts " avg price : " + avg.to_s
  puts " avg discount is : #{(_item["full-price"].to_f - avg).to_f}"

  puts "------------------------------------"
end

puts " _                         _     "
puts "| |                       | |    "
puts "| |__  _ __ __ _ _ __   __| |___ "
puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
puts "| |_) | | | (_| | | | | (_| \\__ \\"
puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
puts ""

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined

brand_list.each do |_brand|
  puts "brand : #{_brand}"
  total_stock = 0
  total_price = 0
  total_sale = 0
  brand_products = products_hash['items'].select {|_item| _item['brand'] == _brand}

  brand_products.each do |_product|
    total_stock += _product['stock']
    total_price += _product['full-price'].to_f
    total_sale += _product['purchases'].length
  end

  puts "total_stock : " + total_stock.to_s
  puts "avg price : " + (total_price / brand_products.length).to_s
  puts "total_sale : " + total_sale.to_s
  puts "------------------------------------------------------------------------"
end
