require 'spec_helper'

describe Category do
  describe 'schema' do
    it { expect(subject).to have_db_column(:name).of_type(:string) }
    it { expect(subject).to have_db_column(:parent_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:lft).of_type(:integer) }
    it { expect(subject).to have_db_column(:rgt).of_type(:integer) }
    it { expect(subject).to have_db_column(:depth).of_type(:integer) }
    it { expect(subject).to have_db_column(:created_at) }
    it { expect(subject).to have_db_column(:updated_at) }
  end
end
