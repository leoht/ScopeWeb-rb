class User < ActiveRecord::Base
  has_many :comments, inverse_of: :user
  has_and_belongs_to_many :notices
  has_and_belongs_to_many :movies
  
  def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  	  user.provider = auth.provider
  	  user.uid = auth.uid
  	  user.name = auth.info.name
  	  user.oauth_token = auth.credentials.token
  	  user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  	  user.save!
  	end
  end

  def profile_picture
    user = FbGraph::User.fetch(uid)
    user.picture + '?type=large'
  end
end
