require 'power_shop/engine'
require 'dry-configurable'

module PowerShop
  extend Dry::Configurable

  setting :cart_cookie_id, :shopping_cart_id

  def self.routes
    Rails.application.routes.draw do
      scope 'catalog' do
        resources :categories, only: [:show]
        resources :products, only: [:show]
        get 'catalog', to: 'catalog#index'
      end

      resource :cart, only: [:show, :destroy], controller: 'cart' do
        post 'add_product/:product_id' => 'cart#add_product', :as => 'add_product'
        delete 'delete_product/:product_id' => 'cart#delete_product', :as => 'delete_product'
      end

      resources :cart_items, only: [:update]

      resource :order, :only => :create do
        get 'success' => 'orders#success'
      end
    end
  end
end
