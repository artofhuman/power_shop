# coding: utf-8
require 'spec_helper'

describe CatalogController, :type => :controller do
  describe 'GET index' do
    let!(:active_product) { create :product }
    let!(:disabled_product) { create :disabled_product }
    let(:expected_products) { assigns(:products) }

    context 'when first page' do
      before { get :index, use_route: 'power_shop' }

      it { expect(response).to be_success }
      it { expect(expected_products.size).to eq 1 }
      it { expect(expected_products).to include active_product }
      it { expect(expected_products).not_to include disabled_product}
    end

    context 'when second page without products' do
      before { get :index, use_route: 'power_shop', page: 2 }

      it { expect(response).to be_success }
    end
  end
end

