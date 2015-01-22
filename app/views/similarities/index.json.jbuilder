json.array!(@similarities) do |similarity|
  json.extract! similarity, :id, :image, :name, :actor, :why
  json.url similarity_url(similarity, format: :json)
end
