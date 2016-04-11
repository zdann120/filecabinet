CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['AWS_KEY_ID'],                        # required
    aws_secret_access_key: ENV['AWS_ACCESS_KEY'],                        # required
  }
  config.fog_directory  = 'znfilecabinet'                          # required
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end