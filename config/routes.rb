# coding: utf-8
PowerShop::Engine.routes.draw do
  scope 'catalog' do
    get '/:id', to: 'catalog#category', as: 'category'
  end

  get 'catalog', to: 'catalog#index'
end
