json.extract! post, :id, :publication_datetime, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
