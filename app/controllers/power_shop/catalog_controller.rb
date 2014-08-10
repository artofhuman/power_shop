module PowerShop
  class CatalogController < ApplicationController
    # Public: show all products with pagination
    #
    # Returns: text/html
    def index
      @products = ::Product.active.order(:sort, :id)
        .page(params[:page])
    end

    # Public: show products inside current category
    #
    # Returns: text/html
    def category
      @category = ::Category.friendly.find(params[:id])

      @products = @category.products.active.order(:sort, :id)
        .page(params[:page])
    end
  end
end
