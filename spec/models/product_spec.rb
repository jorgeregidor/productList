require "rails_helper"

RSpec.describe Product do
	
	describe "Product model" do

		it "name validates_presence_of" do
	  	product = Product.new
	  	product.valid?
	  	expect(product.errors.keys).to eq([:category, :currency, :supplier, :name,:desc, :category_id, :price, :currency_id, :supplier_id])
	  end

	  it "name validates_uniqueness_of" do
	  	product1 = Product.create(name: 'Test')
	  	product2 = Product.create(name: 'Test')
	  	expect(product2.valid?).to_not be
	  end

	  it "currency_name def" do
	  	product = Product.new
	  	expect(product.currency_name).to eq("--")
	  end

	  it "category_name def" do
	  	product = Product.new
	  	expect(product.category_name).to eq("--")
	  end

	  it "supplier_name def" do
	  	product = Product.new
	  	expect(product.supplier_name).to eq("--")
	  end

	end
end