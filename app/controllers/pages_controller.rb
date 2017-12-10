class PagesController < ApplicationController
  def home
  	 @products = Product.all.includes(:category,:currency,:supplier)
  end
end
