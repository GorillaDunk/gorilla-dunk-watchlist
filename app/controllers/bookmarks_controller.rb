class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    # raise
    @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(comment: params[:bookmark][:comment], list: @list, movie: @movie)
    @bookmark.save
    redirect_to list_path(@list)
  end

  def destroy
    id = params[:id].split('/')
    list_id = id[0]
    movie_id = id[1]
    @bookmark = Bookmark.where(movie_id: movie_id, list_id: list_id)
    Bookmark.destroy(@bookmark.ids)
    redirect_to list_path(list_id)
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment)
  end
end
