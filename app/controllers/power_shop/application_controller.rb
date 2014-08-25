module PowerShop
  class ApplicationController < ::ApplicationController

    # Public: get cart from middleware
    # TODO: concern for project application controller
    #
    # Returns ShoppingCart
    def cart
      @cart ||= request.env['shopping_cart']
    end
    helper_method :cart
  end
end
