require 'spec_helper'

describe ShopImage do
  describe 'schema' do
    it { expect(subject).to have_db_column(:subject_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:subject_type).of_type(:string) }
    it { expect(subject).to have_db_column(:image).of_type(:string) }
    it { expect(subject).to have_db_column(:created_at) }
    it { expect(subject).to have_db_column(:updated_at) }
  end
end
