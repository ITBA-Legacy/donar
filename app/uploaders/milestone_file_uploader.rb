# encoding: utf-8
class MilestoneFileUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo

  def extension_white_list
    %w(zip rar)
  end
end
