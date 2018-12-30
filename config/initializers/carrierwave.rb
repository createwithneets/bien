CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJXFFTNMT76S3DO5Q',                        # required unless using use_iam_profile
    aws_secret_access_key: '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',                        # required unless using use_iam_profile
  }
  config.fog_directory  = 'bien-test-reviews'                                      # required

end
