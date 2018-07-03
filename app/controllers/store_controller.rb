class StoreController < ApplicationController
  include CurrentCart
  include SessionCounter

  skip_before_action :authorize

  before_action :set_cart, only: [:index]
  before_action :set_counter, only: [:index]

  def index
    @products = Product.order(:title)
    @counter = session[:counter] if session[:counter] > 5
  end
  
end
