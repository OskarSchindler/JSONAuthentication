class SessionsController < ApplicationController
  

def new
end

def create
  @user = User.authenticate(params[:email], params[:password])
   respond_to do |format|
     if @user
        session[:user_id] = @user.id
        @message = "Log in Successful."
        format.json { render json: @message, status: :found }
      else
        @message = "Log in failed."
        format.json { render json: @message, status: :not_found }
      end
    end
end

def destroy
    @user = User.authenticate(params[:email], params[:password])
    respond_to do |format|
     if @user == current_user && session[:user_id] != nil
         session[:user_id] = nil
         @message = "Log out Successful."
         format.json { render json: @message, status: :ok }
     else
         @message = "You are not authorised to make this request."
         format.json { render json: @message, status: :unauthorised}
     end
  end
end
end





 