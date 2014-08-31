module PowerShop
  class OrdersController < PowerShop::ApplicationController

    # GET: create new order action
    # if order success created, redirect to success page
    #
    # Returns text/html
    def create
      @cart = cart
      @order_form = ::OrderForm.new(@cart, permited_params[:order_form])

      if @order_form.valid?
        if @order_form.perform
          flash[:order_id] = @order_form.order.id
          return redirect_to power_shop.success_order_url
        end
      end

      render :template => 'power_shop/cart/show'
    end

    # GET: show simple page for success message
    #
    # Returns text/html
    def success
    end

    protected
    def permited_params
       params.permit(order_form: [:user_name, :user_phone, :user_email])
    end
  end
end
