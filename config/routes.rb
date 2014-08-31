# coding: utf-8
PowerShop::Engine.routes.draw do
  scope 'catalog' do
    get '/:id', to: 'catalog#category', as: 'category'
    get '/:category_id/:id', to: 'catalog#product', as: 'product'
  end

  get 'catalog', to: 'catalog#index'

  resource :cart, :only => [:show, :destroy], controller: 'cart' do
    post 'add_product/:product_id' => 'cart#add_product', :as => 'add_product'
    delete 'delete_product/:product_id' => 'cart#delete_product', :as => 'delete_product'
  end

  resource :order, :only => :create do
    get 'success' => 'orders#success'
  end
end
