# encoding: utf-8

module PowerShop
  class ShopImageUploader < CarrierWave::Uploader::Base

    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    version :admin_thumb do
      process :resize_to_limit => [100, 100]
    end

    version :thumb do
      process :resize_to_limit => [100, 100]
    end

    def extension_white_list
      %w(jpg jpeg png)
    end
  end
end
