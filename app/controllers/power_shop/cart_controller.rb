module PowerShop
  # Controller represents methods for cart
  class CartController < PowerShop::ApplicationController

    before_filter :find_product, :only => [:add_product, :destroy]
    skip_before_filter :verify_authenticity_token

    # Public: add products to shopping cart
    # if request is simple post redirects back
    # if request is ajax respond with json message
    #
    # Returns text/html or text/json
    def add_product
      cart.add(@product, @product.price, params.fetch(:quantity, 1).to_i)

      binding.pry #NOTE: debugger
      if request.xhr?
        render_json_cart
      else
        redirect_to :back
      end
    end

    def destroy
      # TODO: 99 - its hack for remove all items :)
      cart.remove(@product, 99)
      redirect_to :back
    end

    # Pubclic: show cart page
    # TODO: preload associations
    #
    # Returns text/html
    def show
      @cart = cart
    end

    def update
    end

    protected

    def find_product
      @product = ::Product.find(params[:product_id])
    end

    # Internal: render json response with cart params
    #
    # Returns text/json
    def render_json_cart
      render :json => {
        total_items: cart.total_unique_items,
        subtotal: cart.subtotal
      }.to_json
    end
  end
end
