class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    #@movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    #@bookmark.movie = @movie
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    #@movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    #@bookmark.movie = @movie
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    #@movie = Movie.find(params[:movie_id])
    @bookmark = Bookmark.find(params[:id])
    @list_id = @bookmark.list_id
    #@bookmark.movie = @movie
    redirect_to list_path(@list_id) if @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
