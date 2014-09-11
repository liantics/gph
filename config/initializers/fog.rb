CarrierWave.configure do |config|

  config.fog_credentials = {
    provider: "AWS",
    aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY"),
    aws_secret_access_key: ENV.fetch("AWS_SECRET_KEY"),
    path_style: true
  }

  config.fog_directory = "gph.images"
end
