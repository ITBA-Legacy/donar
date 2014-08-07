# encoding: utf-8
class CampaignImageUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo
end
