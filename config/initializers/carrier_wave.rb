if Rails.env.production?
  CarrierWave.configure do |config|
    # config.fog_credentials = {
    #   provider: "AWS",
    #   aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
    #   aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
    #   region: Rails.application.credentials.dig(:aws, :region)
    # }
    # config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)

    # heroku画像アップロード
    config.storage :fog
    config.fog_provider = "fog/aws"
    config.fog_directory = "aws-oneday-app-s3"
    config.fog_credentials = {
      provider: "AWS",
      aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
      aws_secret_access_key: ENV.fetch("AWS_SECRET_ACCESS_KEY"),
      region: ENV.fetch("AWS_DEFAULT_REGION"),
      path_style: true
    }
  end
end
