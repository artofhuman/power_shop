module PowerShop
  module Middleware
    # Public: class find shopping cart from session for existing user
    # or create new shopping cart in session
    class ShoppingCart
      def initialize(app)
        @app = app
      end

      def call(env)
        unless env['PATH_INFO'] =~ %r{^/assets/}
          env['shopping_cart'] ||= get_or_crete_cart(env['rack.session'])
        end

        @app.call(env)
      end

      def get_or_crete_cart(session)
        cart = ::ShoppingCart.find_or_create_by_id(session[:shopping_cart_id])
        session[:shopping_cart_id] = cart.id

        cart
      end
    end
  end
end
