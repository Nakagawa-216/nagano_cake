class Admins::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    genre = Genre.new(genre_params)
    if genre.save
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンル名を入力して下さい"
      @genre = Genre.new
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンル名を入力してください"
      @genre = Genre.find(params[:id])
      render :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end
end
