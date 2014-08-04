module PowerShop
  class Product < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'products'

    belongs_to :category, dependent: :destroy,
      :counter_cache => true

    has_many :images, :class_name => '::ShopImage', :as => :subject,
      :dependent => :destroy

    accepts_nested_attributes_for :images, :allow_destroy => true
    validates_presence_of :name, :price, :category_id

    scope :active, ->{ where(active: true) }

    # Public: get first image from images
    #
    # Returns ShopImage
    def main_image
      images.first
    end
  end
end
