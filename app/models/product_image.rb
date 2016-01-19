class ProductImage < PowerShop::ProductImage
  mount_uploader :image, ShopImageUploader
end
