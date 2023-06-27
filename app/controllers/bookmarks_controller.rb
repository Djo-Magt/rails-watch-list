class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(book_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
    render :new
    end
  end

  private

  def book_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
