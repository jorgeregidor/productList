require "rails_helper"

RSpec.describe Category do
	
	describe "Category model" do

		it "name validates_presence_of" do
	  	category = Category.new
	  	category.valid?
	  	expect(category.errors.keys).to eq([:name])
	  end

	  it "name validates_uniqueness_of" do
	  	category1 = Category.create(name: 'Test')
	  	category2 = Category.create(name: 'Test')
	  	expect(category2.valid?).to_not be
	  end

	end
end