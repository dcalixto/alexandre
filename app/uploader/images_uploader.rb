class ImagesUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  # def store_dir
  #    'images'
  # end
  version :small do
    process resize_to_fill: [150, 100]
  end

  version :index do
    process resize_to_fill: [350, 205]
  end

  version :thumb do
    process resize_to_fill: [1110, 577]
  end
end
