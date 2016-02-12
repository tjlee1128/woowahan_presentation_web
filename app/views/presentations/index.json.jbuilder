json.array!(@presentations) do |presentation|
  json.extract! presentation, :id, :user_id, :title, :subtitle, :content
  json.url presentation_url(presentation, format: :json)
end
