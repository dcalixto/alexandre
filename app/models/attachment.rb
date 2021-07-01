require_relative '../uploader/images_uploader'
class Attachment < ActiveRecord::Base
		mount_uploader :image, ImagesUploader
    belongs_to :post
end
