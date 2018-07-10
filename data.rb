require 'pry'
require 'rest-client'
require 'json'

@movies = []
def index(search)
  @movies = nil
  if search
    response = RestClient.get "https://api.themoviedb.org/3/search/movie?api_key=8593f125d9ede49fe34d715af7003c5f&language=en-US&query="+"#{search}"+"&page=1&include_adult=false"
    json = JSON.parse(response.body)

    @movies = json["results"].map do |result|

      {
        title: result["title"],
        poster_path: result["poster_path"],
        overview: result["overview"],
        release_date: result["release_date"],
        genres: result["genre_ids"].join(", "),
        apinum: result["id"]
      }

    end
  else
    @movies = Movie.all.order("created_at DESC")
  end
end

Pry.start
