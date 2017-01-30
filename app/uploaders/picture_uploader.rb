class PictureUploader < CarrierWave::Uploader::Base
  if Rails.env.production? || Rails.env.development?
    storage :fog
  else
    storage :file
  end

  def content_type_whitelist
    /image\//
  end

  def store_dir
    "#{Rails.env}/uploads/#{model.user.name}/#{model.id.to_s}/"
  end

end
