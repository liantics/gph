require "carrierwave"
require "mini_magick"

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Process files as they are uploaded:
  process resize_to_limit: [1200, 1000]

  # Create different versions of your uploaded files:
  version :standard_size do
    process resize_to_limit: [640, 360]
  end

  version :avatar, from_version: :standard_size do
    process resize_to_fill: [100, 100]
  end

  version :thumb, from_version: :avatar do
    process resize_to_fill: [50, 50]
  end

  version :featured_slider do
    process resize_to_limit: [1200, 480]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, 
  # see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
