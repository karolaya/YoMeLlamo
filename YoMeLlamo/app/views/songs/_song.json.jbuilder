json.extract! song, :id, :name, :link, :singer_id, :created_at, :updated_at
json.url song_url(song, format: :json)
