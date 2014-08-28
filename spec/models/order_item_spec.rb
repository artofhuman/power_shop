require 'spec_helper'

describe OrderItem do
  describe 'schema' do
    it { expect(subject).to have_db_column(:order_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:product_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:product_title).of_type(:string) }
  end

  describe 'associations' do
    it { expect(subject).to belong_to(:order) }
  end
end
