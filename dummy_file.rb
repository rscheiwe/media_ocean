<%#======================

<% if params[:search] %>
  <!-- <% @movies.map do |movie| %> -->
    <!-- <%= link_to movie.title, movie_path(movie)  %>
    <% check_movies = current_user.movies.select {|um| um == movie } %>
    <% if check_movies.empty? || (!check_movies.empty? && check_movies[0].seen == false) %>
    <%= button_to "Mark as seen", controller: 'user_movies', action: 'create', method: :post, params: { movie_id: movie.id, seen: true }  %>
        <% elsif !check_movies.empty? && !current_user.include?(movie) %>
    <%= "Write A Review" %>
      <% else %>
      <%= "You've reviewed this movie" %>
   <% end %>
  <% end %>
<% end %> -->

<!-- button_to "add to my watchlist", controller: 'user_movies', action: 'create', method: :post, params: { movie_id: movie.id, seen: false } -->
