json.rows @user_favorites do |favorite|
  json.id favorite.presentation.presentation_id
  json.comment_count favorite.presentation.comments.size
  json.view_count favorite.presentation.presentation_view.view_count
  json.thumbs_count favorite.presentation.favorites.size
  json.title favorite.presentation.title
  json.subtitle favorite.presentation.subtitle
  json.content favorite.presentation.content
  json.created_at favorite.presentation.created_at
  json.updated_at favorite.presentation.updated_at
  json.user do
    json.id favorite.presentation.user.user_id
    json.fullname favorite.presentation.user.fullname
    json.team_name favorite.presentation.user.get_team_name(favorite.presentation.user.team_id)
    json.image do
      json.id favorite.presentation.user.image.image_id
      json.file_name favorite.presentation.user.image.image_file_name
      json.file_content_type favorite.presentation.user.image.image_content_type
      json.file_size favorite.presentation.user.image.image_file_size
      json.file_updated_at favorite.presentation.user.image.image_updated_at
      json.medium_url favorite.presentation.user.image.image.url(:medium)
      json.thumb_url favorite.presentation.user.image.image.url(:thumb)
      json.original_url favorite.presentation.user.image.image.url
    end
  end
  if favorite.presentation.video.present?
    json.video do
      json.id favorite.presentation.video.video_id
      json.file_name favorite.presentation.video.video_file_name
      json.file_content_type favorite.presentation.video.video_content_type
      json.file_size favorite.presentation.video.video_file_size
      json.file_updated_at favorite.presentation.video.video_updated_at
      json.thumb_url favorite.presentation.video.video.url(:thumb)
      json.url favorite.presentation.video.video.url
    end
  end
  if favorite.presentation.pdf.present?
    json.pdf do
      json.id favorite.presentation.pdf.pdf_id
      json.file_name favorite.presentation.pdf.pdf_file_name
      json.file_content_type favorite.presentation.pdf.pdf_content_type
      json.file_size favorite.presentation.pdf.pdf_file_size
      json.file_updated_at favorite.presentation.pdf.pdf_updated_at
      json.url favorite.presentation.pdf.pdf.url
    end
  end
  json.images favorite.presentation.images do |image|
    #json.image do
      json.id image.image_id
      json.file_name image.image_file_name
      json.file_content_type image.image_content_type
      json.file_size image.image_file_size
      json.file_updated_at image.image_updated_at
      json.medium_url image.image.url(:medium)
      json.thumb_url image.image.url(:thumb)
      json.original_url image.image.url
    #end
  end
end