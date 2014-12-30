# encoding: utf-8
class MilestoneFileUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo


end
