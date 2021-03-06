class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to request.referer
    else
      render "index"
    end
  end

  def update
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
