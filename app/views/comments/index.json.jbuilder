json.array!(@comments) do |comment|
  json.extract! comment, :id, :ad_id, :body, :user_name
  json.url comment_url(comment, format: :json)
end
