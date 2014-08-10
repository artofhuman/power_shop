module PowerShop
  class CatalogController < ApplicationController
    # Public: show all products with pagination
    #
    # returns text/html
    def index
      @products = ::Product.active.order(:sort, :id)
        .page(params[:page])
    end
  end
end
