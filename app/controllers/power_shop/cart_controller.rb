module PowerShop
  # Controller represents methods for cart
  class CartController < PowerShop::ApplicationController
    skip_before_filter :verify_authenticity_token

    # Public: add products to shopping cart
    # if request is simple post redirects back
    # if request is ajax respond with json message
    #
    # Returns text/html or text/json
    def add_product
      @product = product_resource

      cart.add(@product, @product.price, params.fetch(:quantity, 1).to_i)

      if request.xhr?
        render_json_cart
      else
        redirect_to :back
      end
    end

    def destroy
      # TODO: 99 - its hack for remove all items :)
      cart.remove(product_resource, 99)
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

    def product_resource
      ::Product.find(params[:product_id])
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
