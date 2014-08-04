class Product < PowerShop::Product
  extend FriendlyId
  friendly_id :name, use: :slugged
end
