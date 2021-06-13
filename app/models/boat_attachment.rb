require_relative '../uploader/images_uploader'

class BoatAttachment < ActiveRecord::Base
	mount_uploader :image, ImagesUploader
    belongs_to :boat
end
