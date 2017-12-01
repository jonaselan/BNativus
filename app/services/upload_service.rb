class UploadService
  class << self
    def process(avatar_file)
      img = Cloudinary::Uploader.upload(avatar_file)
      img['url']
    end
  end
end
