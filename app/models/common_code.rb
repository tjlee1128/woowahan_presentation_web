class CommonCode < ApplicationRecord
  def self.find_by_category(category_id)
    find_by_common_code('CATEGORY', category_id)
  end

  def self.find_by_team(team_id)
    find_by_common_code('TEAM', team_id)
  end

  def self.find_by_common_code(common_code_type, common_code_detail_id)
    find_by_common_code_type(common_code_type).find_by_common_code_detail_id(common_code_detail_id)
  end

  def self.find_by_common_code_type(common_code_type)
    where(common_code_type: common_code_type)
  end

  def self.find_by_common_code_detail_id(common_code_detail_id)
    where(common_code_detail_id: common_code_detail_id)
  end
end
