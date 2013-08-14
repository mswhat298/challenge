class HomeController < ApplicationController
  
  def index
  	@projects = Project.all
  end

  def about
  end

# Add a new user from the form
  def newuser
  	respond_to do |format|
  		user=User.new
  		user.name=params[:name]
  		user.fullname=params[:fullname]
  		user.email=params[:email]
  		user.password=params[:password]
    		
        if user.save
          session[:user_id] = user.id
    			flash[:notice] = 'Your Account Is Ready!'
    		else
    			flash[:notice] = 'There was a problem...please try again.'
    		end
         format.html {redirect_to '/home'}
    	
    end
  end

end
