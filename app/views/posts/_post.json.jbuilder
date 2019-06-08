json.extract! post, :id, :publication_datetime, :content, :created_at, :updated_at, :source
json.url post_url(post, format: :json)
