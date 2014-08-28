require 'spec_helper'

describe Order do
  describe 'schema' do
    it { expect(subject).to have_db_column(:user_name).of_type(:string) }
    it { expect(subject).to have_db_column(:user_email).of_type(:string) }
    it { expect(subject).to have_db_column(:user_phone).of_type(:string) }
  end

  describe 'associations' do
    it { expect(subject).to have_many(:order_items) }
  end
end
