class UsersController < ApplicationController

	 before_filter :authenticate_user! ,:only => ['show']

   before_filter :validate_user ,:only => ['show']


  def show
  	@user = User.all

  end

  def edit
  	@user = User.find(params[:id])

  end

   def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_tweets_path(current_user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def validate_user
  	@user = User.find(params[:id])
  	if @user.id != current_user.id
  		redirect_to user_path(current_user)
  	end
  end
end
