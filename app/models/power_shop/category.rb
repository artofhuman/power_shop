module PowerShop
  class Category < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'categories'.freeze

    acts_as_nested_set

    has_many :products, dependent: :destroy, class_name: '::Product'
    has_one :image, class_name: '::ShopImage', as: :subject, dependent: :destroy

    accepts_nested_attributes_for :image, allow_destroy: true

    validates :name, presence: true

    def products_with_child_categories
      ::Product.where(category_id: self_and_descendants.ids)
    end
  end
end
