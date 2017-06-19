class PageController < ApplicationController
  def index
    @notes = Note.where("user_id = :user_id AND status = 0", :user_id => session[:user_id]).order("toDate ASC")
    @notesCount = @notes.count
    User.addPoints(1)
end
end
