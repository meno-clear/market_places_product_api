# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

puts 'ALL USER DESTROYED'

User.create!(email:'test@gmail.com', password: '123456')
User.create!(email:'test2@gmail.com', password: '123456')

puts 'USER CREATED'

MarketPlacePartner.destroy_all

puts 'ALL MARKETPLACEPARTNER DESTROYED'

MarketPlacePartner.create!(name: 'Loja 1', email: 'Loja1@gmail.com', cnpj: '123456789', user_id: 1)
MarketPlacePartner.create!(name: 'Loja 2', email: 'Loja2@gmail.com', cnpj: '123456789', user_id: 2)

puts 'MARKETPLACEPARTNER CREATED'

Product.destroy_all

puts 'ALL PRODUCT DESTROYED'

Product.create!(name: 'Camisa Polo', market_place_partner_id: 1)
Product.create!(name: 'Regata', market_place_partner_id: 2)

puts 'PRODUCT CREATED'