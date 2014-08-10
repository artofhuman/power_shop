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
end
