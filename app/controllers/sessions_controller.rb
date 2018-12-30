class SessionsController < ApplicationController

def new
#login form
end

def create
  #actually try to log in
  #want to take the data out of the form, and see if it matches any of the users

  #create a variable that requires that there be a session being sent through from the form.
  @form_data= params.require(:session)

  #pull out the username and password from the form data
  @username = @form_data[:username]
  @password = @form_data[:password]

#lets check the user is who they say they are
#username: @username= means that it is a variable, ever changing
@user= User.find_by(username: @username).try(:authenticate, @password)
#using the capital "User" becaus we are referencing the user model

#if there is a user present, redirect to homepage
if @user
  #save this user to user's session
  session[:user_id] = @user.id


  redirect_to root_path
else
  render "new"
  #bring it back to login form
end

end


def destroy
  #log us out
  #remove the session completely
  reset_session
  #redirect to log in page
  redirect_to new_session_path 
end



end
