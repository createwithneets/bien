CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials[Rails.env.to_sym][:aws_key],
    aws_secret_access_key: Rails.application.credentials[Rails.env.to_sym][:aws_secret],
    region: "us-west-2"
  }
  config.fog_directory  = Rails.application.credentials[Rails.env.to_sym][:aws_bucket]
end
