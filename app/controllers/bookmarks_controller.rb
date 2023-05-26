class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
    @lists = List.find(params[:list_id])
  end

end
