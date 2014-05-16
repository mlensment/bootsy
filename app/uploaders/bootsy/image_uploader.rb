# encoding: utf-8
module Bootsy
  class ImageUploader < CarrierWave::Uploader::Base
    include CarrierWave::MiniMagick

    storage Bootsy.storage

    def store_dir
      "#{Bootsy.store_dir}"
    end

    # Process files as they are uploaded:
    process resize_to_limit: [1160, 2000]

    version :large do
      if Bootsy.image_versions_available.include?(:large)
        process resize_to_fit: [Bootsy.large_image[:width], Bootsy.large_image[:height]]
      end
    end

    version :medium do
      if Bootsy.image_versions_available.include?(:medium)
        process resize_to_fit: [Bootsy.medium_image[:width], Bootsy.medium_image[:height]]
      end
    end

    version :small do
      if Bootsy.image_versions_available.include?(:small)
        process resize_to_fit: [Bootsy.small_image[:width], Bootsy.small_image[:height]]
      end
    end

    version :thumb do
      if Bootsy.image_versions_available.include?(:thumb)
        process resize_to_fill: [60, 60]
      end
    end

    def extension_white_list
      %w(jpg jpeg gif png)
    end

    def filename
      if original_filename
        if model && model.read_attribute(mounted_as).present?
          model.read_attribute(mounted_as)
        else
          "#{secure_token}.#{file.extension}" if original_filename.present?
        end
      end
    end

    protected
    def secure_token
      var = :"@#{mounted_as}_secure_token"
      model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
    end
  end
end
