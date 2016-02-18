json.rows @comments do |comment|
  json.id comment.comment_id
  json.content comment.content
  json.created_at comment.created_at
  json.updated_at comment.updated_at
  json.user do
    json.id comment.user.user_id
    json.fullname comment.user.fullname
    json.team_name comment.user.get_team_name(comment.user.team_id)
    json.image do
      json.id comment.user.image.image_id
      json.file_name comment.user.image.image_file_name
      json.file_content_type comment.user.image.image_content_type
      json.file_size comment.user.image.image_file_size
      json.file_updated_at comment.user.image.image_updated_at
      json.medium_url comment.user.image.image.url(:medium)
      json.thumb_url comment.user.image.image.url(:thumb)
      json.original_url comment.user.image.image.url
    end
  end
end