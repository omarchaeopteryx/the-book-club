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

    @all_notes = Note.where(book_id: params[:book_id])
    @current_book = Book.find(params[:book_id])
    ## MUST ALSO ADD A CHECK HERE SO THAT IT'S ONLY TEAMS WHICH YOU ARE A COMPANY OF.

    # @only_my_notes = Note.where(book_id: params[:book_id], user_id: get_current_user_id)

    # @only_my_clubs_notes

    @all_notes.order('page_number DESC')

    render 'index'

  end

  def create

    current_user_id = current_user.id
    current_note_page = params[:note][:page_number].to_i

    @new_note = Note.new(body: params[:body], page_number: current_note_page, body: params[:note][:body], book_id: params[:book_id], user_id: current_user_id)

    if @new_note.save
      p "created successfully!"
      redirect_to(book_notes_path(params[:book_id]))
    else
      p "oops, sth is up."
      flash[:notice] = @new_note.errors.full_messages.first
      redirect_to(new_book_note_path)
    end

    p params

  end

  private

  def get_current_book_id
    return params[:book_id]
  end

  def get_current_user_id
    return current_user.id
  end

  def note_params
    # params.require(:note).permit(:page_number, :body) # FIX?
  end
end
