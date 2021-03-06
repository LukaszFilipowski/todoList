class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  def changestatus

    @note = Note.find(params[:id])
    @note.update(:status => 1)

    @user = User.find(session[:user_id])
    @user.update(:points => @user.points+1)

    @history = History.new(:user_id => session[:user_id], :note_id => params[:id], :date => Time.now.strftime("%Y-%m-%d"))
    @history.save

    redirect_to root_path, notice: "Zakończono zadanie"

  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.user_id = session[:user_id]
    @note.status = 0

    respond_to do |format|
      if @note.save
        format.html { redirect_to root_path, notice: 'Pomyślnie dodano' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { redirect_to root_path, notice: 'Musisz wypełnić wszystkie wymagane pola'  }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  def archive
    @notes = Note.where("user_id = :user_id and status = 1", :user_id => session[:user_id])
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to root_path, notice: 'Pomyślnie edytowano' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { redirect_to root_path, notice: 'Błąd podczas edycji' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :text, :toDate, :status, :icon, :color)
    end
end
