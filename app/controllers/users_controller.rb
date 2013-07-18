class UsersController < ApplicationController

  def index
    @users = User.order(:name)
  end

  
  def show
    @user = User.find(params[:id])

  end


  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end

 
  def create
    @user = User.new(params[:user])

      if @user.save
         session[:user_id] = @user.id
         redirect_to store_url, notice: "User #{@user.name} successfully created." 
      else
        render :new 
      end
    
  end

  
  def update
    @user = User.find(params[:id])

    
      if @user.update_attributes(params[:user])
        redirect_to users_url, notice: 'User was successfully updated.' 
      else
        render :edit
      end
    
  end

  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url 
  
  end
end
