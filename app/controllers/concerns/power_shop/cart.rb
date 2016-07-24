module PowerShop
  module Cart
    extend ActiveSupport::Concern

    included do
      helper_method :cart
    end

    def cart
      @cart ||= PowerShop::CartFinder.call(cookies)
    end
  end
end
