# coding: utf-8
require 'spec_helper'

describe PowerShop::CartController, :type => :controller do
  let(:cart) { create :shopping_cart }
  before { controller.stub(:cart).and_return(cart) }

  describe '#POST add_product' do
    let(:product) { create :product, price: 500 }

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
  end

  describe '#GET show' do
    before { get :show, use_route: 'power_shop' }

    it { expect(response).to be_success }
    it {expect(assigns(:cart)).to eq cart }
  end
end
