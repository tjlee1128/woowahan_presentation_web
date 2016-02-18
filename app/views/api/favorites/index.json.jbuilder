json.rows @top5_presentations do |presentation|
  json.id presentation.presentation_id
  json.comment_count presentation.comments.size
  json.view_count presentation.presentation_view.view_count
  json.thumbs_count presentation.favorites.size
  json.title presentation.title
  json.subtitle presentation.subtitle
  json.content presentation.content
  json.created_at presentation.created_at
  json.updated_at presentation.updated_at
  json.user do
    json.id presentation.user.user_id
    json.fullname presentation.user.fullname
    json.team_name presentation.user.get_team_name(presentation.user.team_id)
    json.image do
      json.id presentation.user.image.image_id
      json.file_name presentation.user.image.image_file_name
      json.file_content_type presentation.user.image.image_content_type
      json.file_size presentation.user.image.image_file_size
      json.file_updated_at presentation.user.image.image_updated_at
      json.medium_url presentation.user.image.image.url(:medium)
      json.thumb_url presentation.user.image.image.url(:thumb)
      json.original_url presentation.user.image.image.url
    end
  end
  if presentation.video.present?
    json.video do
      json.id presentation.video.video_id
      json.file_name presentation.video.video_file_name
      json.file_content_type presentation.video.video_content_type
      json.file_size presentation.video.video_file_size
      json.file_updated_at presentation.video.video_updated_at
      json.thumb_url presentation.video.video.url(:thumb)
      json.url presentation.video.video.url
    end
  end
  if presentation.pdf.present?
    json.pdf do
      json.id presentation.pdf.pdf_id
      json.file_name presentation.pdf.pdf_file_name
      json.file_content_type presentation.pdf.pdf_content_type
      json.file_size presentation.pdf.pdf_file_size
      json.file_updated_at presentation.pdf.pdf_updated_at
      json.url presentation.pdf.pdf.url
    end
  end
  json.images presentation.images do |image|
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