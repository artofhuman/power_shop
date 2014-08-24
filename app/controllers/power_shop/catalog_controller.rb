module PowerShop
  class CatalogController < ApplicationController
    # Public: show all products with pagination
    #
    # Returns: text/html
    def index
      @products = scoped_products.page(params[:page])
    end

    # Public: show products inside current category
    #
    # Returns: text/html
    def category
      @category = ::Category.friendly.find(params[:id])
      @products = scoped_products.where(category: @category).page(params[:page])
    end

    # Public: show detail page for product
    #
    # Returns text/html
    def product
      @product = scoped_products.friendly.find(params[:id])
    end

    protected

    def scoped_products
      ::Product.active.order(:sort, :id)
        .includes(:images, :category)
    end
  end
end
