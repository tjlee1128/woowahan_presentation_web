json.id @presentation.presentation_id
json.title @presentation.title
json.comment_count @presentation.comments.size
if @favorite_presentation
  json.thumbs true
else
  json.thumbs false
end
json.subtitle @presentation.subtitle
json.content @presentation.content
json.created_at @presentation.created_at
json.updated_at @presentation.updated_at
json.user do
  json.id @presentation.user.user_id
  json.fullname @presentation.user.fullname
  json.team_name @presentation.user.get_team_name(@presentation.user.team_id)
  json.image do
    json.id @presentation.user.image.image_id
    json.file_name @presentation.user.image.image_file_name
    json.file_content_type @presentation.user.image.image_content_type
    json.file_size @presentation.user.image.image_file_size
    json.file_updated_at @presentation.user.image.image_updated_at
    json.medium_url @presentation.user.image.image.url(:medium)
    json.thumb_url @presentation.user.image.image.url(:thumb)
    json.original_url @presentation.user.image.image.url
  end
end
if @presentation.video.present?
  json.video do
    json.id @presentation.video.video_id
    json.file_name @presentation.video.video_file_name
    json.file_content_type @presentation.video.video_content_type
    json.file_size @presentation.video.video_file_size
    json.file_updated_at @presentation.video.video_updated_at
    json.thumb_url @presentation.video.video.url(:thumb)
    json.url @presentation.video.video.url
  end
end
if @presentation.pdf.present?
  json.pdf do
    json.id @presentation.pdf.pdf_id
    json.file_name @presentation.pdf.pdf_file_name
    json.file_content_type @presentation.pdf.pdf_content_type
    json.file_size @presentation.pdf.pdf_file_size
    json.file_updated_at @presentation.pdf.pdf_updated_at
    json.url @presentation.pdf.pdf.url
  end
end
if @presentation.pdf.present?
  json.images @presentation.images do |image|
    json.id image.image_id
    json.file_name image.image_file_name
    json.file_content_type image.image_content_type
    json.file_size image.image_file_size
    json.file_updated_at image.image_updated_at
    json.medium_url image.image.url(:medium)
    json.thumb_url image.image.url(:thumb)
    json.original_url image.image.url
  end
end
if @presentation.comments.present?
  json.comments @presentation.comments do |comment|
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
end