class PageController < ApplicationController
  def index
    if(session[:user_id] != nil)
      @notes = Note.where("user_id = :user_id AND status = 0", :user_id => session[:user_id]).order("toDate ASC")
      @notesCount = @notes.count
      @archieveCount = Note.where("user_id = :user_id AND status = 1", :user_id => session[:user_id]).count

      @dayObj = User.find(session[:user_id]).dayObj

      today = Time.now.strftime("%Y-%m-%d")
      @historyCount = History.where("user_id = :user_id AND date = :date", :user_id => session[:user_id], :date => today).count

      if(@historyCount >= @dayObj)
        @user = User.find(session[:user_id])
        @user.update(:points => @user.points+1)
      end
    end


end
end
