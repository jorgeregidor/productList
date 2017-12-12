class Product < ApplicationRecord
  belongs_to :category
  belongs_to :currency
  belongs_to :supplier

  validates_uniqueness_of :name
	validates_presence_of :name, :desc, :category_id, :price, :currency_id, :supplier_id

	def currency_name
		if self.currency
			self.currency.name
		else
			"--"
		end
	end

	def category_name
		if self.category
			self.category.name
		else
			"--"
		end
	end

	def supplier_name
		if self.supplier
			self.supplier.name
		else
			"--"
		end
	end

end
