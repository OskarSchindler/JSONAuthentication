class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
      respond_to do |format|
        if @user.save
            @message = "Sign up Successful."
            format.json { render json: @message, status: :created }
        else
            @message = "Sign up failed. This email id is already in use."
            format.json { render json: @message,status: :unprocessable_entity }
        end
      end
  end



  def show
    @user = User.find(params[:id])
      respond_to do |format|
      format.json { render json: @user }
    end
  end


  def update
    respond_to do |format|
      if @user = User.find_by_email(params[:email])
          if  session[:user_id] != nil && @user.id == current_user.id && @user.email == current_user.email
                 current_user.update_attributes(params[:user])
                 @message = "Update Successful. Password changed."
                 format.json { render json: @message ,status: :accepted}
          else
                 @message = "Update failed. Make sure you are logged in."
                 format.json { render json: @message,status: :not_found }
          end
      else
          @message = "Email cannot be changed. Please pass the new password along with the old email id."
          format.json { render json: @message,status: :not_found }
      end 
    end
  end

end
