json.array! @categories do |category|
  json.id category.common_code_detail_id
  json.name category.name_korean
end