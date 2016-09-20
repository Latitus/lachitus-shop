class ProductsController < ApplicationController
  def index
    if params[:type]
      @products = Product.where(ptype: params[:type])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.friendly.find(params[:id])
    @cart_action = @product.cart_action current_user.try :id
  end
end
