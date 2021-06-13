require_relative '../uploader/images_uploader'
class HouseAttachment < ActiveRecord::Base
		mount_uploader :image, ImagesUploader
    belongs_to :house
end
