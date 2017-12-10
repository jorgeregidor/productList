Category.create!(name: "Technology")
Category.create!(name: "Home")
Category.create!(name: "Sport")

puts "3 Categorys Created"

Currency.create!(name: "Euro", code: "EUR")
Currency.create!(name: "Sterling", code: "GBP")
Currency.create!(name: "Dollar", code: "USD")

puts "3 Currencies Created"

Supplier.create!(name: "Amazon")
Supplier.create!(name: "AliExpress")
Supplier.create!(name: "DealExtreme")
Supplier.create!(name: "Ebay")

puts "4 Suppliers Created"

Product.create!(name: "Product 1", desc: "desc1" , price: 12.56, category_id: Category.first.id, supplier_id: Supplier.first.id, currency_id: Currency.first.id )
Product.create!(name: "Product 2", desc: "desc2" , price: 12.56, category_id: Category.first.id, supplier_id: Supplier.first.id, currency_id: Currency.first.id )
Product.create!(name: "Product 3", desc: "desc3" , price: 12.56, category_id: Category.first.id, supplier_id: Supplier.first.id, currency_id: Currency.first.id )
Product.create!(name: "Product 4", desc: "desc4" , price: 12.56, category_id: Category.first.id, supplier_id: Supplier.first.id, currency_id: Currency.first.id )

puts "4 Products Created"

User.create!(email: "admin@admin.com", password: "admin1", password_confirmation: "admin1", admin: true)

puts "Admin user Created"