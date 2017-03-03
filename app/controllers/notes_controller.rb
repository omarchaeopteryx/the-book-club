class NotesController < ApplicationController

  def new

    @page = Page.create(book_id: params[:book_id])
    @book = Book.find_by_id(params[:book_id])
    @current_user_id = current_user.id
    @note = Note.new(page_id: @page.id, user_id: @curent_user_id)

    p "new items:"
    p @page
    p @note

  end

  def index

  end

  def create
    p "Hit create"
    p params

  end

  private

  def note_params
    params.require(:note).permit(:page, :body, :book_id, :current_user_id) # FIX?
  end
end
