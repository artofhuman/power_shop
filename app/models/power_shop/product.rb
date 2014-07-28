module PowerShop
  class Product < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'products'

    belongs_to :category, dependent: :destroy,
      :counter_cache => true

    validates_presence_of :name, :price, :category_id

    scope :active, ->{ where(active: true) }
  end
end
