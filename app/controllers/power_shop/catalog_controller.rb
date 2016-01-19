module PowerShop
  class CatalogController < PowerShop::ApplicationController
    # Public: show all products with pagination
    #
    # Returns: text/html
    def index
      @products = scoped_products.page(params[:page])
    end

    # Public: show detail page for product
    #
    # Returns text/html
    def product
      @category = ::Category.friendly.find(params[:category_id])
      @product = scoped_products.friendly.find(params[:id])
    end

    protected

    def scoped_products
      ::Product.active.includes(:images, :category)
    end
  end
end
