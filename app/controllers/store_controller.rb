class StoreController < ApplicationController
  include CurrentCart
  include SessionCounter

  before_action :set_cart, only: [:index]
  before_action :set_counter, only: [:index]

  def index
    @products = Product.order(:title)
    @counter = session[:counter]
  end
  
end
