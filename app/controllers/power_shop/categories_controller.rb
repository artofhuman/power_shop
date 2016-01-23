module PowerShop
  class CategoriesController < ApplicationController
    def show
      @category = ::Category.find(params[:id])

      @products = @category
                    .products_with_child_categories
                    .where(active: true)
                    .page(params[:page])
                    .per(products_per_page)
    end

    private

    def products_per_page
      1
    end
  end
end
