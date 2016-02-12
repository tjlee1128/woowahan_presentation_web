class Presentation < ApplicationRecord
  belongs_to :user
  has_many :images, as: :imageable
  has_one :video
  has_one :pdf
end
