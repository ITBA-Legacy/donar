# encoding: utf-8
class AvatarUploader < CarrierWave::Uploader::Base
  storage :postgresql_lo
end
