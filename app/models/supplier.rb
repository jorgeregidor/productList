class Supplier < ApplicationRecord
	has_many :products

	validates_uniqueness_of :name
	validates_presence_of :name
end
