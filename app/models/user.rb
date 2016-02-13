class User < ApplicationRecord
  has_one :image, as: :imageable
  has_many :presentations

  def self.available_email(email)
    find_by(email: email).nil? if email.present?
  end

  def self.existed_user(email, password)
    find_by(email: email, password: password) if (email && password).present?
  end

  def image_url
    if image.present?
      image.image.url
    else
      'system/images/default_user.png'
    end
  end

  def get_team_name(team_id)
  	CommonCode.find_by_team(team_id).first.name_korean
  end
end