class Product < ApplicationRecord
  belongs_to :category
  belongs_to :currency
  belongs_to :supplier

  validates_uniqueness_of :name
	validates_presence_of :name, :desc, :category_id, :price, :currency_id, :supplier_id
end
