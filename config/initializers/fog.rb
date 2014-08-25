CarrierWave.configure do |config|

  config.fog_credentials = {
  provider: 'AWS',
  aws_access_key_id: ENV.fetch("AWS_ACCESS_KEY_ID"),
  aws_secret_access_key: ENV.fetch("AWS_SECRET_KEY"),
  }

  config.fog_directory = "green_planet_heroes_images"
  config.fog_attributes = {"Cache-Control'=>'max-age=315576000"}
end
