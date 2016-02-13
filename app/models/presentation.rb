class Presentation < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_one :video
  has_one :pdf

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  def get_category_name(category_id)
  	CommonCode.find_by_category(category_id).first.name_korean
  end
end
