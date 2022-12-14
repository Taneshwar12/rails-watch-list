class BookmarksController < ApplicationController
  # GET request
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  # POST request
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render '/lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.select { |b| b.movie_id == params[:id].to_i && b.list_id == params[:list_id].to_i }
    @bookmark[0].destroy
    redirect_to list_path(params[:list_id]), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
