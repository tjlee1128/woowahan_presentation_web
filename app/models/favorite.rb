class Favorite < ApplicationRecord
  belongs_to :presentation, counter_cache: true
  belongs_to :user

  def self.find_by_test  
    where('created_at >= ?', 7.day.ago)
  end
end
