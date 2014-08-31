# coding: utf-8
require 'spec_helper'

describe PowerShop::CartController, :type => :controller do
  let(:cart) { create :shopping_cart }
  let(:product) { create :product, price: 500 }

  before { controller.stub(:cart).and_return(cart) }

  describe '#POST add_product' do
    before { request.env["HTTP_REFERER"] = "/" }

    context 'when request is not xhr' do
      before { post :add_product, product_id: product.id, use_route: 'power_shop' }

      it { expect(response).to redirect_to '/' }
      it { expect(cart.shopping_cart_items.first.price).to eq 500 }
      it { expect(cart.shopping_cart_items.first.quantity).to eq 1 }
      it { expect(cart.shopping_cart_items.size).to eq 1 }
    end

    context 'when request is xhr' do
      before { xhr :post, :add_product, product_id: product.id, use_route: 'power_shop' }

      subject(:expected_json) { JSON.parse(response.body) }

      it { expect(response).to be_success }
      it { expect(expected_json['total_items']).to eq 1 }
      it { expect(expected_json['subtotal']).to eq 500 }
    end

    context 'when exists quantity param' do
      before { post :add_product, product_id: product.id, quantity: 2, use_route: 'power_shop' }

      it { expect(cart.shopping_cart_items.first.quantity).to eq 2 }
    end
  end

  describe '#DELETE delete_product' do
    before do
      request.env["HTTP_REFERER"] = "/cart"
      cart.add(product, product.price, 2)
      delete :delete_product, product_id: product.id, use_route: 'power_shop'
    end

    it { expect(cart.reload).to be_empty }
    it { expect(response).to redirect_to '/cart' }
  end

  describe '#GET show' do
    before { get :show, use_route: 'power_shop' }

    it { expect(response).to be_success }
    it {expect(assigns(:cart)).to eq cart }
  end
end
