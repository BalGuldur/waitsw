class UserController < ApplicationController
  def index
  end

  def show
  end

  def login
  end
  
  #POST
  def authorizate
    #TODO check username and pass by LDAP
    if @user=User.first #TODO change method find by username
      if @user.password==params[:password]
        #TODO create session
        render "index/#{@user.id}"
      else
        #TODO error message
        redirect_to :back
      end
    else
      redirect_to :back
    end
  end

end
