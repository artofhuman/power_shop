class Category < PowerShop::Category
  extend FriendlyId
  friendly_id :name, use: :slugged
end
