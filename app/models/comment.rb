class Comment < ApplicationRecord
  belongs_to :presentation, counter_cache: true
  belongs_to :user
end
