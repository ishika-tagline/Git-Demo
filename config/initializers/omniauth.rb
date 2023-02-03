Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['719843696390543'], ENV['248f9aa77e4e2556914f5368566b515a']
  provider :facebook, '719843696390543', '248f9aa77e4e2556914f5368566b515a'
end
