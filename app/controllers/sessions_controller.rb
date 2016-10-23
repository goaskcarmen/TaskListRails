class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']

    # by default - login failed
    flash[:notice] = "Login failed!"
    return redirect_to root_path unless auth_hash['uid']

    # find the person in the database, if the person is new from the site, build the new user and save the user.
   @user = User.find_by(uid: auth_hash[:uid], provider: 'github')
   if @user.nil?
     # User doesn't match anything in the DB.
     # Attempt to create a new user.
     @user = User.build_from_github(auth_hash)
     flash[:notice] = "Unable to Save the User"
     return redirect_to root_path unless @user.save
   end

   # Save the user ID in the session
   # This is the user.id on the local database, NOT the uid that github gives us
   session[:user_id] = @user.id

   flash[:notice] = "Successfully Logged in!"
   redirect_to index_path
  end

  def destroy
    session[:user_id] = nil
  end
end
