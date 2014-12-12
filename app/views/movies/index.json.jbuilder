json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :year, :actor, :description, :picture, :raiting, :genre
  json.url movie_url(movie, format: :json)
end
