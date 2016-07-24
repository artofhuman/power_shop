module PowerShop
  # Find cart by cookie name or create new one.
  #
  # @api public
  class CartFinder
    # @param [ActionDispatch::Cookies::CookieJar] cookies object
    #
    # @return [ShoppingCart]
    def self.call(cookies)
      cookie_cart_name = PowerShop.config.cart_cookie_id

      cart = ShoppingCart
        .where(id: cookies[cookie_cart_name])
        .first_or_create

      cookies[cookie_cart_name] = {value: cart.id, expires: 1.year.from_now}

      cart
    end
  end
end
