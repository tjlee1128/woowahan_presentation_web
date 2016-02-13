class UserAuth < ApplicationRecord
  belongs_to :user

  def find_by_access_token(access_token)
    find_by(access_token: access_token) if access_token.present?
  end
end
