require "rails_helper"

RSpec.describe Supplier do
	
	describe "Supplier model" do

		it "name validates_presence_of" do
	  	supplier = Supplier.new
	  	supplier.valid?
	  	expect(supplier.errors.keys).to eq([:name])
	  end

	  it "name validates_uniqueness_of" do
	  	supplier1 = Supplier.create(name: 'Test')
	  	supplier2 = Supplier.create(name: 'Test')
	  	expect(supplier2.valid?).to_not be
	  end

	end
end