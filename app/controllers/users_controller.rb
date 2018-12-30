class UsersController < ApplicationController

def index
  @users = User.all
  #find ALL the users in this index
end




def show
  @user= User.find_by(username: params[:id])
end




def new
#a form for adding a new user
@user = User.new

end


def create
#take params from form
#create a new users
  @user= User.new(form_params)

# if valid, it saves and go to list users page
# if not, see the form with errors

if @user.save
#save the session with the user (re-use the same code as session)
#we create a user ID for this session
session[:user_id] = @user.id

  redirect_to users_path
else
  render "new"
  #this will render it with all the errors
end

end

def form_params
  params.require(:user).permit(:username, :email, :password, :password_confirmation)
end


end
