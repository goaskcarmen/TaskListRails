class User < ActiveRecord::Base
  validates :email, :uid, :provider, presence: true

  has_many :tasks
  
  def self.build_from_github(auth_hash)

    # find or create a user based on the information in the auth_hash
    user = User.find_or_initialize_by(uid: auth_hash[:uid], provider: 'github')
    user.uid   = auth_hash[:uid]
    user.provider = 'github'
    user.name  = auth_hash['info']['name']
    user.email = auth_hash['info']['email']
    # user.avatar = auth_hash['extra']['raw_info']['avatar_url']
    # user.followercount = auth_hash['extra']['raw_info']['followers'].to_i

    user.save

    return user
  end
end
