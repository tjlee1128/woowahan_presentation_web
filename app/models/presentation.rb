class Presentation < ApplicationRecord
  belongs_to :user, counter_cache: true
  has_many :images, as: :imageable
  has_one :video
  has_one :pdf
  has_many :comments
  has_one :presentation_view
  has_many :favorites

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  scope :find_by_user, lambda { |user|
    where(user_id: user) if user.present?
  }

  scope :top5, -> {
    select("presentations.presentation_id, count(favorites.favorite_id) AS favorites_count").
    joins(:favorites).
    where("favorites.created_at >= ?", 7.day.ago).
    group("presentations.presentation_id").
    order("favorites_count DESC").
    limit(5)
  }

  def get_category_name(category_id)
  	CommonCode.find_by_category(category_id).first.name_korean
  end
end
