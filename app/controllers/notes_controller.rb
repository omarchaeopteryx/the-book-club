class NotesController < ApplicationController

  def new

    # @page = Page.create(book_id: params[:book_id])
    @book = Book.find(params[:book_id])
    @current_user_id = current_user.id
    @note = Note.new(book_id: params[:book_id], user_id: @curent_user_id)

    p "new items:"
    p @note

  end

  def index

  end

  def create

    current_user_id = current_user.id
    current_note_page = params[:note][:page_number].to_i

    @new_note = Note.new(body: params[:body], page_number: current_note_page, body: params[:note][:body], book_id: params[:book_id], user_id: current_user_id)

    if @new_note.save
      p "created successfully!"
      redirect_to(new_book_note_path) and return
    else
      p "oops, sth is up."
    end

    redirect_to(new_book_note_path) and return
    p params

  end

  private

  def note_params
    # params.require(:note).permit(:page_number, :body) # FIX?
  end
end
