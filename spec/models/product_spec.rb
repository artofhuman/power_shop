require 'spec_helper'

describe Product do
  describe 'schema' do
    it { expect(subject).to have_db_column(:name).of_type(:string) }
    it { expect(subject).to have_db_column(:category_id).of_type(:integer) }
    it { expect(subject).to have_db_column(:slug).of_type(:string) }
    it { expect(subject).to have_db_column(:image).of_type(:string) }
    it { expect(subject).to have_db_column(:description).of_type(:text) }
    it { expect(subject).to have_db_column(:price).of_type(:float) }
    it { expect(subject).to have_db_column(:description).of_type(:text) }
  end

  describe 'associations' do
    it { expect(subject).to belong_to(:category) }
    it { expect(subject).to have_many(:images) }
  end

  describe 'validations' do
    it { expect(subject).to validate_presence_of(:name) }
    it { expect(subject).to validate_presence_of(:category_id) }
    it { expect(subject).to validate_presence_of(:price) }
  end
end

