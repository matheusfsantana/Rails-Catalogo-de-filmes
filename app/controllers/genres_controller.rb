class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @movies = Movie.where(genre_id: @genre.id)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      return redirect_to genres_path 
    end

    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      return redirect_to genres_path 
    end

    render :edit
  end

  # def destroy
  #   @genre = Genre.find(params[:id])
  #   @genre.destroy
  #   redirect_to(new_genre_path)
  # end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
