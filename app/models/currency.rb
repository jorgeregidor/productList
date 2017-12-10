class Currency < ApplicationRecord
	has_many :products

	validates_uniqueness_of :name, :code
	validates_presence_of :name, :code
end
