module PowerShop
  class CartItemsController < ApplicationController
    def update
      cart_item = ShoppingCartItem.find(params[:id])
      cart_item.update_quantity(params.fetch(:quantity))
    end
  end
end
