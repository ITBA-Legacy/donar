# encoding: utf-8
class MilestoneFileUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end