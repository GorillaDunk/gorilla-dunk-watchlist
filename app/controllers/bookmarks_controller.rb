class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @lists = List.find(params[:id])
  end

end
