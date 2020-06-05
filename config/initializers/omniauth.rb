Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :facebook unless Rails.env.production?
    provider :facebook, ENV['722782501853779'], ENV['fe5d75ebf1da9f1020330d6f4cfeb7ed']
  end

