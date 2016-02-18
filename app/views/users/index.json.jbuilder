json.rows @users do |user|
  json.id user.id
  json.email user.email
  json.fullname user.fullname
  json.team_id user.team_id
  json.team_name user.get_team_name(user.team_id)
  json.image do
    json.id user.image.image_id
    json.file_name user.image.image_file_name
    json.file_content_type user.image.image_content_type
    json.file_size user.image.image_file_size
    json.file_updated_at user.image.image_updated_at
    json.medium_url user.image.image.url(:medium)
    json.thumb_url user.image.image.url(:thumb)
    json.original_url user.image.image.url
  end
  json.presentations_count user.presentations.size
end
