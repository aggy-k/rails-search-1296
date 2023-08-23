class MoviesController < ApplicationController
  def index
    puts "params ====> #{params}"
    @movies = Movie.all

    if params[:query].present?
      # @movies = @movies.where(title: params[:query])
      # Superman
      # ... superman ...
      # @movies = @movies.where("title ILIKE ?", "%#{params[:query]}%")

      # sql_query = <<~SQL
      #   movies.title @@ :query
      #   OR movies.synopsis @@ :query
      #   OR directors.first_name @@ :query
      #   OR directors.last_name @@ :query
      # SQL

      # @movies = @movies.where(sql_query, query: "%#{params[:query]}%")
      # SELECT * FROM movies JOIN directors ON directors.id = movies.director_id
      # @movies = @movies.joins(:director).where(sql_query, query: "%#{params[:query]}%")

      @movies = @movies.global_search(params[:query])
    end
  end
end
