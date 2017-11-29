
class ImageUserUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process convert: 'png'

  version :standard do
    process eager: true
    process resize_to_fill: [100, 150, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
  end
end
