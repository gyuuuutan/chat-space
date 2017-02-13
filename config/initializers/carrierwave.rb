require 'dotenv-rails'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1',
    path_style: true
  }

  case Rails.env
    when 'production', 'development'
      config.fog_directory = 'jychatspace'
      config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/jychatspace'
    when 'test'
      :file
  end
end

# 日本語入力を可能にする
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
