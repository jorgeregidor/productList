require "rails_helper"

RSpec.describe Currency do
	
	describe "Currency model" do

		it "name code validates_presence_of" do
	  	currency = Currency.new
	  	currency.valid?
	  	expect(currency.errors.keys).to eq([:name, :code])
	  end

	  it "name validates_uniqueness_of" do
	  	currency1 = Currency.create(name: 'Test', code: 'AAA')
	  	currency2 = Currency.create(name: 'Test', code: 'BBB')
	  	expect(currency2.valid?).to_not be
	  end

	   it "code validates_uniqueness_of" do
	  	currency1 = Currency.create(name: 'Test1', code: 'AAA')
	  	currency2 = Currency.create(name: 'Test2', code: 'AAA')
	  	expect(currency2.valid?).to_not be
	  end

	end
end