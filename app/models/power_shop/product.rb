module PowerShop
  class Product < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'products'.freeze

    belongs_to :category, class_name: '::Category'

    after_create :increment_category_count, if: ->(product) { product.active? }
    after_destroy :decrement_category_count
    after_update :update_category_count, if: ->(product) { product.active_changed? }

    has_many :images, class_name: '::ProductImage', dependent: :destroy

    accepts_nested_attributes_for :images, :allow_destroy => true
    validates_presence_of :name, :price, :category_id

    scope :active, -> { where(active: true) }

    # Public: get first image from images
    #
    # Returns ShopImage
    def main_image
      images.first
    end

    private

    def increment_category_count
      ::Category.increment_counter(:products_count, category_id)
    end

    def decrement_category_count
      ::Category.decrement_counter(:products_count, category_id)
    end

    def update_category_count
      active? ? increment_category_count : decrement_category_count
    end
  end
end
