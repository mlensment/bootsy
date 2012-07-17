module Bootsy
  class Image < ActiveRecord::Base
    belongs_to :image_gallery

    mount_uploader :image_file, ImageUploader

    attr_accessible :image_file

    validates_presence_of :image_file, :image_gallery_id

    def pau
      'pica'
    end
  end
end