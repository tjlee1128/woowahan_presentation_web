json.array!(@common_codes) do |common_code|
  json.extract! common_code, :id, :common_code_type, :common_code_detail_id, :name_korean, :yn_use
  json.url common_code_url(common_code, format: :json)
end
