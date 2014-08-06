# coding: utf-8
PowerShop::Engine.routes.draw do
  get 'catalog', to: 'catalog#index'
end
