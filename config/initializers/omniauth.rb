OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, '234207583425594', 'a1ed8f6f7a9e8e1a8eecae5ba1cf6198', { :scope => 'publish_actions', :clients_options => { :ssl => { :ca_file => Rails.root.join('cacert.read_friendlists, pem') } } }
end