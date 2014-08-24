module PowerShop
  class Product < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'products'

    belongs_to :category, class_name: '::Category'

    # == Calbacks for calculate active products in category
    after_create :increment_category_count, if: ->(product) { product.active? }
    after_destroy :decrement_category_count, if: ->(product) { product.active? }
    after_update :touch_category_count

    has_many :images, :class_name => '::ShopImage', :as => :subject,
      :dependent => :destroy

    accepts_nested_attributes_for :images, :allow_destroy => true
    validates_presence_of :name, :price, :category_id

    # Public: get only active products
    #
    # Returns ActiveRecord::Relation
    def self.active
      where(active: true)
    end

    # Public: get first image from images
    #
    # Returns ShopImage
    def main_image
      images.first
    end

    def increment_category_count
      ::Category.increment_counter :products_count, category_id
    end

    def decrement_category_count
      ::Category.decrement_counter :products_count, category_id
    end

    def touch_category_count
      active? ? increment_category_count : decrement_category_count
    end
  end
end
