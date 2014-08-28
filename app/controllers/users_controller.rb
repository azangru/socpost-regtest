class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def create
    # run default version defined in Devise::RegistrationsController
    super
    # then redirect to the index page
    redirect_to users_path
  end

  # responds to json requests to check whether login is unique
  def check_login
    login = params["login"]
    @unique = (User.find_by_username login)? false : true
    respond_to do |format|
      format.json { render :json => @unique }
    end
  end

end