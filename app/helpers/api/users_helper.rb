module Api::UsersHelper
  def self.gen_user_auth(user)
    access_token = get_access_token(user)
    access_token = get_access_token(user) while duplicated(access_token)
    UserAuth.create(user_id: user.id, access_token: access_token)
  end

  def self.duplicated(access_token)
    UserAuth.all.find_by_access_token(access_token).present?
  end

  def self.get_access_token(user)
    id = user.user_id
    pw = user.password
    realm = Digest::SHA1.hexdigest(SecureRandom.base64)
    Digest::MD5.hexdigest([id, realm, pw].join(':'))
  end
end
