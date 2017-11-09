CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:      ENV["S3_KEY"],                        # required
    ws_secret_access_key:  ENV["S3_SECRET"],                        # required
    #aws_access_key_id:      'asuldkajdlkajsdlkj',                        # required
    #aws_secret_access_key:  'asdsadsadas',                        # required
    region:                'us-east-1'                  # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'crsappsample'                          # required
  config.fog_public     = true                                        # optional, defaults to true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" } # optional, defaults to {}
end
