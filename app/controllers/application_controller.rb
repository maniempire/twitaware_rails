class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # before_filter :load_tweets

    def load_tweets
      @general_tweets = Twitter.user_timeline[0..4] # For this demonstration lets keep the tweets limited to the first 5 available.
      
    end
  
  
    def after_sign_in_path_for(resource)                                                                                                                                                                                                                                                                         
          "/home/index"                                                                                                                                                                                                                                         
     end
  
end
