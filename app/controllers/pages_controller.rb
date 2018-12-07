class PagesController < ApplicationController

def show
  if @logged_in_user
    redirect_to @logged_in_user
  else
  session["user_id"] = nil
  if Book.all != nil && Group.all!= nil
  @books = Book.all
  @books.sort_by{|t| t.groups.count}
  render :welcome
end
  end

end

def index
  session["user_id"] = nil
  if Book.all != nil && Group.all!= nil
  @books = Book.all
  @books = @books.sort_by{|t| t.groups.count}.reverse
  @logged_in_user = nil
  render :welcome
end
end

end
