require "carrierwave/orm/activerecord"

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => Rails.application.secrets.aws_access_key_id,
    :aws_secret_access_key  => Rails.application.secrets.aws_secret_access_key,
    :host                   => 's3.amazonaws.com',
  }
  config.fog_directory  = Rails.application.secrets.aws_s3_bucket
  config.fog_public     = false
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"}
end
