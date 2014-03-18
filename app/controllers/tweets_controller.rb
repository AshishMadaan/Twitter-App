class TweetsController < ApplicationController
  def index

  	@tweet = current_user.tweets.build

  	@tweets = current_user.tweets
  end

  def create

  	 #user = User.find(params[:user_id])
    @tweet = current_user.tweets.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html {redirect_to user_tweets_path(current_user)}
      else
        format.html { render action: "new" }
      end
  end
  end

  def destroy
    
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
    format.html {redirect_to user_tweets_path(current_user)}

  end
end
end
