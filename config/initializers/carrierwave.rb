CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJXEXHB47KU6HQVHQ',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile
  }
  config.fog_directory  = 'bien-test-reviews'                                      # required

end
