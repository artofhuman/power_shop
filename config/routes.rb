# coding: utf-8
PowerShop::Engine.routes.draw do
  scope 'catalog' do
    get '/:id', to: 'catalog#category', as: 'category'
    get '/:category_id/:id', to: 'catalog#product', as: 'product'
  end

  get 'catalog', to: 'catalog#index'
end
