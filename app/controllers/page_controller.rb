class PageController < ApplicationController
  def index
    @notes = Note.where(user_id: session[:user_id])
    @notesCount = @notes.count
end
end
