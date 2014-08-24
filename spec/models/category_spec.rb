# coding: utf-8
require 'spec_helper'

describe Category do
  describe 'schema' do
    it { expect(subject).to have_db_column(:name).of_type(:string) }
    it { expect(subject).to have_db_column(:slug).of_type(:string) }
    it { expect(subject).to have_db_column(:parent_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:lft).of_type(:integer) }
    it { expect(subject).to have_db_column(:rgt).of_type(:integer) }
    it { expect(subject).to have_db_column(:depth).of_type(:integer) }
    it { expect(subject).to have_db_column(:created_at) }
    it { expect(subject).to have_db_column(:updated_at) }
    it { expect(subject).to have_db_column(:description) }
  end

  describe 'associations' do
    it { expect(subject).to have_many(:products) }
    it { expect(subject).to have_one(:image) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
  end

  describe 'delete' do
    let(:product) { create :product}
    let(:category) { product.category }

    it 'delete category products after delete category' do
      expect { category.destroy! }.to change { category.products.count }.by(-1)
    end
  end

  describe '#products_count' do
    context 'when product active' do
      let(:active_product) { create :product, active: true }
      subject(:category) { active_product.category.reload }

      it { expect(category.products_count).to eq 1 }
      it 'changes products count' do
        expect{ active_product.destroy! }
          .to change { category.reload.products_count }.by(-1)
      end

      it 'changes products count' do
        active_product.update_attributes(active: false)
        expect(category.products_count).to eq 0
      end
    end

    context 'when product disabled' do
      let(:disabled_product) { create :disabled_product }
      subject(:category) { disabled_product.category.reload }

      it { expect(category.products_count).to eq 0 }
      it 'not changes products count' do
        disabled_product.destroy!
        expect(category.products_count).to eq 0
      end

      it 'changes products count' do
        disabled_product.update_attributes(active: true)
        expect(category.products_count).to eq 1
      end
    end
  end
end
