# coding: utf-8
require 'spec_helper'

describe CatalogController, :type => :controller do
  let(:category) { create :category }
  let!(:active_product) { create :product, category: category }
  let!(:disabled_product) { create :disabled_product, category: category }

  describe 'GET #index' do
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

  describe 'GET #category' do
    let(:expected_products) { assigns(:products) }

    before { get :category, id: category.slug, use_route: 'power_shop' }

    it { expect(response).to be_success }
    it { expect(assigns(:category)).to eq category }
    it { expect(expected_products.size).to eq 1 }
    it { expect(expected_products).to include active_product }
    it { expect(expected_products).not_to include disabled_product}
  end

  describe 'GET #product' do

    context 'when wrong category slug' do
      let(:product) { create :product, active: true }

      subject(:get) do
        get :product, id: product.slug, category_id: 'wrong-slug',
          use_route: 'power_shop'
      end

      it { expect{ get }.to raise_error }
    end

    context 'when product active' do
      let(:product) { create :product, active: true }

      before do
        get :product, id: product.slug, category_id: category.slug,
          use_route: 'power_shop'
      end

      it { expect(response).to be_success }
      it { expect(assigns(:product)).to eq product }
    end

    context 'when product disabled' do
      let(:product) { create :disabled_product }

      subject(:get) do
        get :product, id: product.slug, category_id: product.category.slug,
          use_route: 'power_shop'
      end

      it { expect{ get }.to raise_error }
    end
  end
end

