class Admin::GenresController < ApplicationController
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
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
