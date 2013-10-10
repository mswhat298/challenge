class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  ###
  #Registers user as a teacher once they've downloaded a graph & supply list
  ###
  def teach_chk
    if (session[:user_id])
     @user = User.find_by_name(params[:user_id])
      
      respond_to do |format|
      @user.teacher=1
      
          if @user.save
           format.html { redirect_to '/downloads/TINY_sewingroom.pdf' }
           else
          flash[:notice] = 'ERROR: You are NOT a new teacher.'
          format.html {redirect_to '/home'}
        end

      end
  else
    flash[:notice] = 'Please log in to download challenge.'
    redirect_to '/home'
    end
  end

  #From show page, allows user to select a "teacher", ie who introduced them to the design.
  def teach_register
    respond_to do |format|
      userproject = Userproject.new
      userproject.project_id = params[:project_id]
      userproject.user_id = params[:user_id]
      userproject.teacher = params[:teacher]

      if userproject.save
          flash[:notice] = "Your teacher has been registered!"
        else
          flash[:notice] = "There was a problem, please try again."
      end
      format.html {redirect_to '/home'}

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :fullname, :date, :email, :password, :avatar)
    end
end
